import 'package:next_pass/core/constants/app_linker.dart';
import 'package:next_pass/core/widgets/custom_dropdown.dart';
import 'package:next_pass/core/widgets/generate_password_button.dart';
import 'package:next_pass/features/add_new_credential/controller/category_list_controller.dart';
import 'package:next_pass/features/add_new_credential/controller/reminder_list_controller.dart';

class AddNewCredentialForm extends StatelessWidget {
  const AddNewCredentialForm({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => CategoryListController());
    Get.lazyPut(() => ReminderListController());
    final AddNewCredentialController controller =
        Get.find<AddNewCredentialController>();
    PasswordController passwordController = Get.put(PasswordController());
    final CategoryListController categoryController =
        Get.find<CategoryListController>();
    final ReminderListController reminderController =
        Get.find<ReminderListController>();

    final _formKey = GlobalKey<FormState>(); // Added form key
    final RxBool isSecure = true.obs;

    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(20.r)),
      child: Form(
        key: _formKey, // Wrapped the form with validation
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.credentialNC,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: 15.h),
            Text(
              AppStrings.siteAddressLabelNC,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(height: 10.h),
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
                  value!.isEmpty ? "Enter Site URL" : null, // Validation added
            ),
            SizedBox(height: 20.h),
            Text(
              AppStrings.siteTitle,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(height: 10.h),
            TextFormField(
              textInputAction: TextInputAction.next,
              controller: controller.titleController,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.label,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                hintText: AppStrings.siteTitle,
              ),
              validator: (value) =>
                  value!.isEmpty ? "Enter Title" : null, // Validation added
            ),
            SizedBox(height: 20.h),
            Text(
              AppStrings.userNameLabelNC,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(height: 10.h),
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
            SizedBox(height: 20.h),
            Text(
              AppStrings.emailLabelNC,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(height: 10.h),
            TextFormField(
              textInputAction: TextInputAction.next,
              controller: controller.emailId,
              obscureText: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.alternate_email,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                hintText: AppStrings.emailHintTextNC,
              ),
              validator: (value) =>
                  value!.isEmpty ? "Enter Email Address" : null,
            ),
            SizedBox(height: 20.h),
            Text(
              AppStrings.phoneNumberLabelNC,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(height: 10.h),
            TextFormField(
              textInputAction: TextInputAction.next,
              controller: controller.mobileNumber,
              obscureText: false,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.call,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                hintText: AppStrings.phoneNumberHintTextNC,
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              AppStrings.passwordAddressLabelNC,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(height: 10.h),
            Obx(() => TextFormField(
                  textInputAction: TextInputAction.done,
                  controller: controller.password,
                  obscureText: isSecure.value, // Toggle password visibility
                  onChanged: (value) {
                    passwordController.checkPasswordStrength(value);
                  },
                  decoration: InputDecoration(
                    suffixIcon: InkWell(
                      onTap: () {
                        isSecure.value = !isSecure.value; // Toggle value
                      },
                      child: Icon(
                        isSecure.value
                            ? Icons.visibility_off
                            : Icons.visibility, // Eye icon toggle
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.lock_rounded,
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                    hintText: AppStrings.passwordHintTextNC,
                  ),
                  validator: (value) =>
                      value!.isEmpty ? "Enter Password*" : null,
                )),
            SizedBox(height: 20.h),
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
            SizedBox(height: 10.h),
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
                    SizedBox(height: 5.h),
                    CustomDropdown(
                      itemList: const [
                        '7 Days',
                        '15 Days',
                        '30 Days',
                        '60 Days',
                        '90 Days'
                      ],
                      controller: reminderController,
                      popupWidth: 100.0,
                      maxWidth: 130.0,
                      maxHeight: 40.0,
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
                    SizedBox(height: 5.h),
                    CustomDropdown(
                      itemList: const ['Website', 'App', 'Payment', 'Other'],
                      controller: categoryController,
                      popupWidth: 100.0,
                      maxWidth: 130.0,
                      maxHeight: 40.0,
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 30.h),
            PrimaryButton(
              text: AppStrings.buttonSave,
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  try {
                    controller.saveCredential(
                      controller.userName.text,
                      controller.emailId.text,
                      controller.titleController.text,
                      controller.password.text,
                      controller.mobileNumber.text,
                      categoryController.selectedValue.value,
                      reminderController.selectedValue.value,
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
