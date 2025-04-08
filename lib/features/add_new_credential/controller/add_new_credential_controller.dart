import 'package:next_pass/core/utils/messages.dart';
import 'package:next_pass/features/add_new_credential/controller/reminder_list_controller.dart';

import '../../../core/constants/app_linker.dart';

class AddNewCredentialController extends GetxController {
  final CredentialInterface credentialRepository =
      Get.put(CredentialRepository());
  final HomeScreenController homeScreenController =
      Get.put(HomeScreenController()); // Injected automatically
  final PasswordController passwordController = Get.put(PasswordController());
  final ReminderListController reminderListController =
      Get.put(ReminderListController());

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

    // Update siteUrl whenever the user types in the TextField
    siteUrlController.addListener(() {
      siteUrl.value = siteUrlController.text.trim();
    });
    password.addListener(() {
      passwordController.checkPasswordStrength(password.text.trim());
    });

    reminderDayValue.value = reminderListController.getReminderValue();
  }

  Future<void> saveCredential(
      userName, emailId, titleController, password, mobileNumber) async {
    isLoading.value = true;
    try {
      var success = await credentialRepository.createNewCredential(
        siteUrl.value,
        userName,
        emailId,
        titleController,
        mobileNumber,
        password,
        reminderDayValue.value,
      );
      if (success) {
        await homeScreenController
            .fetchCredentials(); // Fetch updated credentials
        clearFormFields();
        SuccessMessage("Credential saved successfully!");
      } else {
        ErrorMessage("Failed to add credential");
      }
    } catch (e) {
      print(e.toString());
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
  }
}
