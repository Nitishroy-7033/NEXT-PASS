import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/credential_repository.dart';
import '../data/interface.dart';
import '../models/new_credenatial.dart';

class AddNewCredentialController extends GetxController {
  final CredentialInterface credentialRepository =
      Get.put(CredentialRepository());

  // Controllers for the form fields
  TextEditingController siteUrl = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController emailId = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController title = TextEditingController();

  Future<void> saveCredential() async {
    final newCredential = CredentialModel(
      siteUrl: siteUrl.text,
      userName: userName.text,
      emailId: emailId.text,
      password: password.text,
      phoneNumber: mobileNumber.text,
    );

    final success =
        await credentialRepository.createNewCredeantial(newCredential);
    if (success) {
      // Handle success (e.g., show a success message or navigate to another screen)
      Get.snackbar("Success", "Credential added successfully");
    } else {
      // Handle failure (e.g., show an error message)
      Get.snackbar("Error", "Failed to add credential");
    }
  }
}
