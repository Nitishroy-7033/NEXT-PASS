import '../../../core/constants/app_linker.dart';

class HomeScreenController extends GetxController {
  final HomeRepository homeRepository = Get.put(HomeRepository()); // ✅ Injected

  var isLoading = false.obs;
  var credentials = <HomeModel>[].obs;
  var isError = false.obs;
  var errorMessage = "".obs;
  RxBool isMoreTabOpen = false.obs; // ✅ Tracks whether the More tab is open

  Future<void> fetchCredentials() async {
  isLoading.value = true;
  isError.value = false;
  errorMessage.value = "";

  try {
    final response = await homeRepository.getCredentials();
        print("API Full Response: ${response.toString()}");  // ✅ Actual API Response Print
        print("API Success: ${response.success}");  // ✅ Success Status
        print("API Message: ${response.message}");  
    if (response.success == true && response.data is List<HomeModel>) {
      credentials.assignAll(response.data!);
      SuccessMessage(response.message ?? "Credentials fetched successfully");
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