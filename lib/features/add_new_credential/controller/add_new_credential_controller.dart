import '../../../core/constants/app_linker.dart';

class AddNewCredentialController extends GetxController {
  final CredentialInterface credentialRepository =
      Get.put(CredentialRepository());
  final PasswordController passwordController = Get.put(PasswordController());

  RxString siteUrl = ''.obs; // Observable URL
  var reminderDayValue = 30.obs;

  TextEditingController siteUrlController = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController emailId = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();

  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    siteUrlController.addListener(() {
      siteUrl.value = siteUrlController.text.trim();
    });
    password.addListener(() {
      passwordController.checkPasswordStrength(password.text.trim());
    });
  }

  Future<void> saveCredential(
    String userName,
    String emailId,
    String title,
    String password,
    String mobileNumber,
    String categoryCred,
    String passwordChangeReminder,
  ) async {
    try {
      isLoading.value = true;
      // Extract number from reminder string (e.g., "30 Days" -> 30)
      final reminderDays =
          int.tryParse(passwordChangeReminder.split(' ')[0]) ?? 30;

      var success = await credentialRepository.createNewCredential(
        siteUrl.value,
        userName,
        emailId,
        title,
        mobileNumber,
        password,
        categoryCred,
        reminderDays
            .toString(), // Send as string if API expects it, or adjust backend
      );

      if (success) {
        clearFormFields();
        SuccessMessage("Credential saved successfully!");
      } else {
        ErrorMessage("Failed to add credential");
      }
    } catch (e) {
      ErrorMessage("Error saving credential: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void clearFormFields() {
    siteUrlController.clear();
    userName.clear();
    emailId.clear();
    titleController.clear();
    password.clear();
    mobileNumber.clear();
    siteUrl.value = '';
  }

  @override
  void onClose() {
    siteUrlController.dispose();
    userName.dispose();
    emailId.dispose();
    titleController.dispose();
    password.dispose();
    mobileNumber.dispose();
    super.onClose();
  }
}
