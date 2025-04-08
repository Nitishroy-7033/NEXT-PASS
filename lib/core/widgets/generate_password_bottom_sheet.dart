import 'package:next_pass/core/constants/app_linker.dart';

Future<dynamic> bottomSheetPasswordGenerator(BuildContext context) {
  PasswordController passwordController = Get.put(PasswordController());
  AddNewCredentialController addNewCredentialController =
      Get.put(AddNewCredentialController());
  return Get.bottomSheet(
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r)),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Text(
                AppStrings.generatePassword,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            SizedBox(height: 20.h),
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
            SizedBox(height: 20.h),
            // All Check boxes section
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Use Uppercase
                    _buildCheckbox(
                      context,
                      passwordController.useUpperCase,
                      AppStrings.useUpperCase,
                    ),
                    // Use Lowercase
                    _buildCheckbox(
                      context,
                      passwordController.useLowerCase,
                      AppStrings.useLowerCase,
                    ),
                  ],
                ),
                SizedBox(width: 20.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Use Numbers
                    _buildCheckbox(
                      context,
                      passwordController.useNumbers,
                      AppStrings.useNumbers,
                    ),
                    // Use Synbols
                    _buildCheckbox(
                      context,
                      passwordController.useSymbols,
                      AppStrings.useSymbols,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20.h),
            // Password Length Slider
            Text(AppStrings.passwordLength,
                style: Theme.of(context).textTheme.labelMedium),
            SizedBox(height: 10.h),
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
                      activeColor: Theme.of(context).colorScheme.primary,
                      inactiveColor: Theme.of(context).colorScheme.tertiary,
                      onChanged: (value) =>
                          passwordController.sliderValue.value = value,
                    ),
                  ),
                ),
                const Text("100"),
              ],
            ),
            SizedBox(height: 20.h),
            PrimaryButton(
              text: "COPY & INSERT",
              onPressed: () {
                addNewCredentialController.password.text =
                    passwordController.generatedPassword.value;
                Get.back();
              },
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    ),
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
  );
}

// Helper function for checkboxes
Widget _buildCheckbox(BuildContext context, RxBool value, String text) {
  return Row(
    children: [
      Obx(
        () => Checkbox(
          value: value.value,
          onChanged: (newValue) => value.value = newValue!,
        ),
      ),
      Text(text, style: Theme.of(context).textTheme.bodySmall),
    ],
  );
}
