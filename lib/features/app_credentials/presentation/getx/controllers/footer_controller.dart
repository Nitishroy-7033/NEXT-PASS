import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:next_pass/core/constants/app_linker.dart';
import 'package:next_pass/core/utils/messages.dart';

class FooterController extends GetxController {
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void onEditPressed() {
    print("Edit button clicked");
  }

  void onDeletePressed() {
    print("Delete button clicked");
  }

// Invite User Function
  void onInviteUser() async {
    emailController.clear(); // Clear previous input

    final result = await Get.dialog<bool>(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppStrings.inviteUser,
                  style: Get.textTheme.titleMedium,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: AppStrings.emailt,
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppStrings.pleaseEnterEmail;
                    }
                    if (!value.isEmail) {
                      return AppStrings.enterValidEmail;
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () => Get.back(result: false),
                      child: Text(AppStrings.cancel),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          Get.back(result: true);
                        }
                      },
                      child: Text(AppStrings.invite),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );

    if (result == true && emailController.text.isNotEmpty) {
      try {
        SuccessMessage(AppStrings.inviteSuccess);
      } catch (e) {
        ErrorMessage(AppStrings.inviteError);
      }
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}
