
// import 'package:next_pass/core/constants/app_linker.dart';

// class CredentialController extends GetxController {
  // var password = ''.obs;
  // var isPasswordVisible = false.obs;

  // void togglePasswordVisibility() {
  //   isPasswordVisible.value = !isPasswordVisible.value;
  // }

  // String getPasswordStrength() {
  //   if (password.value.length < 6) {
  //     return "Weak";
  //   } else if (password.value.length < 10) {
  //     return "Medium";
  //   } else {
  //     return "Strong";
  //   }
  // }

//   // Controllers for user input
//   final titleController = TextEditingController();
//   final siteUrlController = TextEditingController();
//   final usernameController = TextEditingController();
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();

//   @override
//   void onInit() {
//     super.onInit();
//     // Initialize controllers with default values
//     titleController.text = "Facebook";
//     siteUrlController.text = "https://github.com";
//     usernameController.text = "berarahul";
//     emailController.text = "rb6764385@gmail.com";
//     passwordController.text = "rahul009";
//   }


//     var isEditing = false.obs;

//   void toggleEditing() {
//     isEditing.value = !isEditing.value;
//   }

//     void saveEditedCredentials() {
//     // Save the entered data
//     print("Saving Data...");
//     print("Title: ${titleController.text}");
//     print("Site URL: ${siteUrlController.text}");
//     print("Username: ${usernameController.text}");
//     print("Email: ${emailController.text}");
//     print("Password: ${passwordController.text}");
    
//     // Toggle back to view mode
//     toggleEditing();
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CredentialController extends GetxController {

    var password = ''.obs;
  var isPasswordVisible = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  String getPasswordStrength() {
    if (password.value.length < 6) {
      return "Weak";
    } else if (password.value.length < 10) {
      return "Medium";
    } else {
      return "Strong";
    }
  }
  var isEditing = false.obs;

  // Controllers for user input
  final titleController = TextEditingController();
  final siteUrlController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    // Initialize controllers with default values
    titleController.text = "Facebook";
    siteUrlController.text = "https://github.com";
    usernameController.text = "berarahul";
    emailController.text = "rb6764385@gmail.com";
    passwordController.text = "rahul009";
  }

  void toggleEditing() {
    isEditing.value = !isEditing.value;
  }

  void saveEditedCredentials() {
    // Trigger UI update
    isEditing.refresh();
  }
}
