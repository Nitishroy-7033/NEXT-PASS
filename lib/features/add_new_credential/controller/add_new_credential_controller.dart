import 'package:next_pass/core/utils/messages.dart';

import '../../../core/constants/app_linker.dart';

class AddNewCredentialController extends GetxController {
  final CredentialInterface credentialRepository =
      Get.put(CredentialRepository());

  final PasswordController passwordController = Get.put(PasswordController());

  TextEditingController siteUrlController = TextEditingController();
  RxString siteUrl = ''.obs; // Observable URL

  TextEditingController userName = TextEditingController();
  TextEditingController emailId = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();

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

  Future<void> saveCredential(
      userName, emailId, titleController, password, mobileNumber) async {
    var success = await credentialRepository.createNewCredential(siteUrl.value,
        userName, emailId, titleController, mobileNumber, password);
    if (success) {
      clearFormFields();
      SuccessMessage("Credential saved successfully!");
    } else {
      ErrorMessage("Failed to add credential");
    }
  }

  void clearFormFields() {
    siteUrlController.clear();
    userName.clear();
    emailId.clear();
    titleController.clear();
    password.clear();
    mobileNumber.clear();
  }
}
