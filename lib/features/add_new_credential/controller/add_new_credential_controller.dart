import '../../../core/constants/app_linker.dart';

class AddNewCredentialController extends GetxController {
  final CredentialInterface credentialRepository =
      Get.put(CredentialRepository());

  final PasswordController passwordController = Get.put(PasswordController());

  TextEditingController siteUrlController = TextEditingController();
  RxString siteUrl = ''.obs; // Observable URL

  TextEditingController userName = TextEditingController();
  TextEditingController emailId = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController title = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    // Update siteUrl whenever the user types in the TextField
    siteUrlController.addListener(() {
      siteUrl.value = siteUrlController.text.trim();
    });
    password.addListener(() {
      passwordController.checkPasswordStrength(password.text.trim());
    });
  }

  Future<void> saveCredential(userName, emailId, password, mobileNumber) async {
    var success = await credentialRepository.createNewCredential(
        siteUrl.value, userName, emailId, mobileNumber, password);
    if (success) {
      Get.snackbar("Success", "Credential added successfully");
    } else {
      Get.snackbar("Error", "Failed to add credential");
    }
  }
}
