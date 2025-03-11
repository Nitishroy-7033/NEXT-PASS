import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:next_pass/features/add_new_credential/data/credential_repository.dart';

class AddNewCredentialController extends GetxController {
  final CredentialRepository credentialRepository =
      Get.put(CredentialRepository());

  final siteUrl = TextEditingController();
  final userName = TextEditingController();
  final email = TextEditingController();
  final mobileNumber = TextEditingController();
  final password = TextEditingController();

  Future<void> addCredential() async {
    bool success = await credentialRepository.createNewCredential(
      siteUrl.text.trim(),
      userName.text.trim(),
      email.text.trim(),
      mobileNumber.text.trim(),
      password.text.trim(),
    );

    if (success) {
      Get.snackbar("Success", "Credential saved successfully!",
          snackPosition: SnackPosition.BOTTOM);
      clearForm();
    } else {
      Get.snackbar("Error", "Failed to save credential.",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void clearForm() {
    siteUrl.clear();
    userName.clear();
    email.clear();
    mobileNumber.clear();
    password.clear();
  }
}
