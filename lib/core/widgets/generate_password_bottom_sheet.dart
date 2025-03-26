import 'package:next_pass/core/constants/app_linker.dart';

Future<dynamic> BottomSheetPasswordGenerator(BuildContext context) {
  PasswordController passwordController = Get.put(PasswordController());
  AddNewCredentialController addNewCredentialController =
      Get.put(AddNewCredentialController());
  return Get.bottomSheet(
    Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // const SizedBox(height: 10),
            Center(
              child: Text(
                AppStrings.generatePassword,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
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
                const SizedBox(width: 20),
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
            const SizedBox(height: 20),
            // Password Length Slider
            Text(AppStrings.passwordLength,
                style: Theme.of(context).textTheme.labelMedium),
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
            const SizedBox(height: 20),
            PrimaryButton(
              text: "COPY & INSERT",
              onPressed: () {
                addNewCredentialController.password.text =
                    passwordController.generatedPassword.value;
                Get.back();
              },
            ),
            const SizedBox(height: 20),
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
