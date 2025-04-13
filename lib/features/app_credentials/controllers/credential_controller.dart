import '../../../core/constants/app_linker.dart';

class CredentialController extends GetxController {
  final CredentialInterface credentialRepository =
      Get.put(CredentialRepository());

  var password = ''.obs;
  var isPasswordVisible = false.obs;

  late CredentialModel credential;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  var isEditing = false.obs;
  var isLoading = false.obs;

  // Controllers for user input
  final titleController = TextEditingController();
  final siteUrlController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  int? passwordChangeReminder;
  String? passwordCategory;

  @override
  // void onInit() {
  //   super.onInit();
  //   // Initialize controllers with default values
  //   titleController.text = "Facebook";
  //   siteUrlController.text = "https://github.com";
  //   usernameController.text = "berarahul";
  //   emailController.text = "rb6764385@gmail.com";
  //   passwordController.text = "rahul009";
  // }
  void onInit() {
    super.onInit();
    credential = Get.arguments["credential"]; // Null Safety
    print("Received Arguments: $credential");
    titleController.text = credential.title!;
    siteUrlController.text = credential.siteUrl!;
    usernameController.text = credential.userName!;
    emailController.text = credential.emailId!;
    passwordController.text = credential.password!;
    passwordChangeReminder = credential.passwordChangeReminder ?? 30;
    passwordCategory = credential.categoryCred ?? "Web";
  }

  void toggleEditing() {
    isEditing.value = !isEditing.value;
  }

  void saveEditedCredentials() {
    // Trigger UI update
    isPasswordVisible.value = false;
    isEditing.refresh();
  }

  Future<void> deleteCredential() async {
    try {
      isLoading.value = true;
      var success = await credentialRepository.deleteCredential(credential.id!);

      if (success) {
        SuccessMessage("Credential Deleted successfully!");
        Get.offAllNamed(AppRoutes.home);
      } else {
        ErrorMessage("Failed to Delete Credential");
      }
    } catch (e) {
      ErrorMessage("Error deleting credential: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
