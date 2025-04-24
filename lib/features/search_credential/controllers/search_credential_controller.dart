import 'package:next_pass/core/constants/app_linker.dart';

class SearchCredentialController extends GetxController {
  var searchQuery = ''.obs;
  var selectedCategory = ''.obs;
  var searchResults = <CredentialModel>[].obs;

  void search(String query) {
    searchQuery.value = query;
    _updateSearchResults();
  }

  void selectCategory(String category) {
    if (selectedCategory.value == category) {
      selectedCategory.value = '';
    } else {
      selectedCategory.value = category;
    }
    _updateSearchResults();
  }

  void _updateSearchResults() {
    final homeController = Get.find<HomeScreenController>();
    final allCredentials = homeController.credentials;

    final query = searchQuery.value.toLowerCase();
    final category = selectedCategory.value.toLowerCase();

    final filtered = allCredentials.where((cred) {
      final matchesQuery = query.isEmpty ||
          cred.title!.toLowerCase().contains(query) ||
          cred.emailId!.toLowerCase().contains(query) ||
          cred.userName!.toLowerCase().contains(query);

      final matchesCategory = category.isEmpty ||
          (cred.categoryCred?.toLowerCase() ?? '').contains(category);

      return matchesQuery && matchesCategory;
    }).toList();

    searchResults.assignAll(filtered);
  }
}
