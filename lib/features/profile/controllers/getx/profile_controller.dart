import 'package:next_pass/core/constants/app_linker.dart';

class ProfileController extends GetxController {
  final ProfileRepository profileRepository = Get.put(ProfileRepository());
  final ApiClient apiClient = Get.find<ApiClient>();

  var isLoading = false.obs;
  var profileModel = Rx<ProfileModel?>(null);
  var isError = false.obs;
  var errorMessage = "".obs;

  @override
  void onInit() {
     print("🔍 ProfileController onInit called");
    getProfileInfo();
    super.onInit();
  }

  Future<void> getProfileInfo() async {
    isLoading.value = true;
    isError.value = false;
    errorMessage.value = "";

    try {
      print("🌐 Calling API to fetch profile info...");
      final response = await profileRepository.GetProfileInfo();
print("✅ API response: ${response.data}");
      if (response.success == true && response.data != null) {
        profileModel.value = response.data;
        // You can replace SuccessMessage with any other notification or logger.
        print(response.message ?? "Profile fetched successfully");
      } else {
        handleError(response.message?.toString() ?? "Unknown error");
      }
    } catch (e) {
       print("❌ Error while fetching profile info: $e");
      print("Error: $e");
      handleError(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void handleError(String message) {
    isError.value = true;
    errorMessage.value = message;
    print("Error: $message");
    // Here, you can also show a toast/snackbar for the error.
  }
}
