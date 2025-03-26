import 'package:next_pass/core/constants/app_linker.dart';
import 'package:next_pass/core/widgets/custom_dropdown.dart';
import 'package:next_pass/core/widgets/generate_password_button.dart';
import 'package:next_pass/features/add_new_credential/controller/category_list_controller.dart';
import 'package:next_pass/features/add_new_credential/controller/reminder_list_controller.dart';

class AddNewCredentialForm extends StatelessWidget {
  const AddNewCredentialForm({super.key});

  @override
  Widget build(BuildContext context) {
    final AddNewCredentialController controller =
        Get.find<AddNewCredentialController>();
    PasswordController passwordController = Get.put(PasswordController());

    final _formKey = GlobalKey<FormState>();
    final RxBool isSecure = true.obs; // Added form key

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(20)),
      child: Form(
        key: _formKey, // Wrapped the form with validation
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.credentialNC,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 15),
            Text(
              AppStrings.siteAddressLabelNC,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: 10),
            TextFormField(
              textInputAction: TextInputAction.next,
              controller: controller.siteUrlController,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.language,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                hintText: AppStrings.siteHintTextNC,
              ),
              validator: (value) =>
                  value!.isEmpty ? "Enter Site URL*" : null, // Validation added
            ),
            const SizedBox(height: 20),
            Text(
              AppStrings.userNameLabelNC,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: 10),
            TextFormField(
              textInputAction: TextInputAction.next,
              controller: controller.userName,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.person,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                hintText: AppStrings.userNameHintTextNC,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              AppStrings.emailLabelNC,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: 10),
            TextFormField(
              textInputAction: TextInputAction.next,
              controller: controller.emailId,
              obscureText: false,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.alternate_email,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                hintText: AppStrings.emailHintTextNC,
              ),
              validator: (value) =>
                  value!.isEmpty ? "Enter Email Address*" : null,
            ),
            const SizedBox(height: 20),
            Text(
              AppStrings.phoneNumberLabelNC,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: 10),
            TextFormField(
              textInputAction: TextInputAction.next,
              controller: controller.mobileNumber,
              obscureText: false,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.call,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                hintText: AppStrings.phoneNumberHintTextNC,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              AppStrings.passwordAddressLabelNC,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: 10),
            Obx(
              () => TextFormField(
                textInputAction: TextInputAction.done,
                controller: controller.password,
                obscureText: isSecure.value,
                onChanged: (value) {
                  passwordController.checkPasswordStrength(value);
                },
                decoration: InputDecoration(
                  suffixIcon: InkWell(
                    onTap: () {
                      isSecure.value = !isSecure.value;
                    },
                    child: Icon(
                      isSecure.value
                          ? Icons.remove_red_eye_outlined
                          : Icons.remove_red_eye,
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.lock_rounded,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                  hintText: AppStrings.passwordHintTextNC,
                ),
                validator: (value) => value!.isEmpty ? "Enter Password*" : null,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const GeneratePasswordButton(),
                Obx(
                  () => (passwordController.passwordStrength.value.isNotEmpty)
                      ? StrengthBadge(
                          strength: passwordController.passwordStrength.value,
                        )
                      : const SizedBox.shrink(),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.reminderNC,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    const SizedBox(height: 5),
                    CustomDropdown(
                      itemList: const [
                        '7 Days',
                        '15 Days',
                        '30 Days',
                        '60 Days',
                        '90 Days'
                      ],
                      controller: ReminderListController(),
                      popupWidth: 90,
                      maxWidth: 120,
                      maxHeight: 40,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.categoryNC,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    const SizedBox(height: 5),
                    CustomDropdown(
                      itemList: const ['Website', 'App', 'Payment', 'Other'],
                      controller: CategoryListController(),
                      popupWidth: 120,
                      maxWidth: 130,
                      maxHeight: 40,
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 30),
            PrimaryButton(
              text: AppStrings.buttonSave,
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  try {
                    controller.saveCredential(
                      controller.userName.text,
                      controller.emailId.text,
                      controller.password.text,
                      controller.mobileNumber.text,
                    );
                  } catch (e) {
                    print(e.toString());
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
