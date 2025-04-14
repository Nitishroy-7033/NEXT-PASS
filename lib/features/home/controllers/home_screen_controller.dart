import '../../../core/constants/app_linker.dart';

class HomeScreenController extends GetxController {
  final HomeRepository homeRepository = Get.put(HomeRepository()); // ✅ Injected

  var isLoading = false.obs;
  var credentials = <CredentialModel>[].obs;
  var isError = false.obs;
  var errorMessage = "".obs;
  RxBool isMoreTabOpen = false.obs; // ✅ Tracks whether the More tab is open

  Future<void> fetchCredentials() async {
  isLoading.value = true;
  isError.value = false;
  errorMessage.value = "";

  try {
    final response = await homeRepository.getCredentials();
    if (response.success == true && response.data is List<CredentialModel>) {
      credentials.assignAll(response.data!);
    } else {
      _handleError(response.message ?? "Failed to fetch credentials");
    }
  } catch (e) {
    _handleError(e.toString());
  } finally {
    isLoading.value = false;
  }
}


  /// Toggles the More tab state
  void runMoreTab() {
    isMoreTabOpen.value = !isMoreTabOpen.value;
  }

  /// Handles API errors
  void _handleError(dynamic response) {
    isError.value = true;
    errorMessage.value = response.toString();
    print(response);
    ErrorMessage(errorMessage.value);
  }
}