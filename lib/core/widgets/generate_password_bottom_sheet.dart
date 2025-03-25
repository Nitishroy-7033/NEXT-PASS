import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:next_pass/core/constants/app_linker.dart';

Future<dynamic> BottomSheetPasswordGenerator(BuildContext context) {
  PasswordController passwordController = Get.put(PasswordController());
  AddNewCredentialController addNewCredentialController =
      Get.put(AddNewCredentialController());
  return Get.bottomSheet(
    Container(
      height: 450,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Center(child: Text(AppStrings.generatePassword)),
            const SizedBox(height: 20),

            // Password Display Field
            Obx(
              () => TextFormField(
                controller: TextEditingController(
                    text: passwordController.generatedPassword.value),
                readOnly: true,
                decoration: InputDecoration(
                  hintText: AppStrings.passwordHintText,
                  suffixIcon: IconButton(
                    icon: Icon(Icons.refresh,
                        color: Theme.of(context).colorScheme.primary),
                    onPressed: () {
                      passwordController.generatePassword();
                    },
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildCheckbox(
                    passwordController.useUpperCase, AppStrings.useUpperCase),
                _buildCheckbox(
                    passwordController.useNumbers, AppStrings.useNumbers),
              ],
            ),

            // Lowercase & Symbols Toggle
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildCheckbox(
                    passwordController.useLowerCase, AppStrings.useLowerCase),
                _buildCheckbox(
                    passwordController.useSymbols, AppStrings.useSymbols),
              ],
            ),

            const SizedBox(height: 20),

            // Password Length Slider
            Text(AppStrings.passwordLength,
                style: Theme.of(context).textTheme.labelSmall),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text("4"),
                Expanded(
                  child: Obx(
                    () => Slider(
                      label: passwordController.sliderValue.value
                          .toInt()
                          .toString(),
                      divisions: 100,
                      min: 4,
                      max: 100,
                      value: passwordController.sliderValue.value,
                      onChanged: (value) =>
                          passwordController.sliderValue.value = value,
                    ),
                  ),
                ),
                const Text("100"),
              ],
            ),

            const SizedBox(height: 30),

            PrimaryButton(
                text: "COPY & INSERT",
                onPressed: () {
                  addNewCredentialController.password.text =
                      passwordController.generatedPassword.value;
                  Get.back();
                }),
          ],
        ),
      ),
    ),
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
  );
}

// Helper function for checkboxes
Widget _buildCheckbox(RxBool value, String text) {
  return Row(
    children: [
      Obx(
        () => Checkbox(
          value: value.value,
          onChanged: (newValue) => value.value = newValue!,
        ),
      ),
      SizedBox(width: 10),
      Text(text, style: TextStyle(fontSize: 16)),
    ],
  );
}
