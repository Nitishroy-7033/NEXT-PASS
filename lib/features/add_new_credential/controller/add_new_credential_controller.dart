import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/credential_repository.dart';
import '../data/interface.dart';

class AddNewCredentialController extends GetxController {
  final CredentialInterface credentialRepository =
      Get.put(CredentialRepository());

  RxList credentials = [].obs;
  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;

  onIntit() {
    super.onInit();
    fetchCredentials();
  }

  // Controllers for the form fields
  TextEditingController siteUrl = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController emailId = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController title = TextEditingController();

  // Future<void> saveCredential() async {
  //   final newCredential = CredentialModel(
  //     siteUrl: siteUrl.text,
  //     userName: userName.text,
  //     emailId: emailId.text,
  //     password: password.text,
  //     phoneNumber: mobileNumber.text,
  //   );

  //   final success =
  //       // await credentialRepository.createNewCredeantial(newCredential);
  //   if (success) {
  //     // Handle success (e.g., show a success message or navigate to another screen)
  //     Get.snackbar("Success", "Credential added successfully");
  //   } else {
  //     // Handle failure (e.g., show an error message)
  //     Get.snackbar("Error", "Failed to add credential");
  //   }
  // }

  Future<void> fetchCredentials() async {
    isLoading.value = true;
    try {
      credentials = (await credentialRepository.getAllCredentials()) as RxList;
      errorMessage.value = '';
    } catch (error) {
      errorMessage.value = error.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
