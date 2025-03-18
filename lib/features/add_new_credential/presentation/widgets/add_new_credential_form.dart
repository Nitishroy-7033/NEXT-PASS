import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:next_pass/core/constants/app_linker.dart';
import 'package:next_pass/core/widgets/custom_dropdown.dart';
import 'package:next_pass/core/widgets/generate_password_button.dart';
import 'package:next_pass/features/add_new_credential/controller/category_list_controller.dart';
import 'package:next_pass/features/add_new_credential/controller/reminder_list_controller.dart';

class AddNewCredentialForm extends StatelessWidget {
  AddNewCredentialForm({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final AddNewCredentialController controller =
        Get.find<AddNewCredentialController>();
    final _formKey = GlobalKey<FormState>();

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
<<<<<<< HEAD
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Form(
        key: _formKey, // Apply the form key
=======
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(20)),
      child: Form(
        key: _formKey,
>>>>>>> 11329ca341e15bcebc644df914a1d8a6caffdbd3
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.credentialNC,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 15),
<<<<<<< HEAD

            // 🔹 Site Address
=======
>>>>>>> 11329ca341e15bcebc644df914a1d8a6caffdbd3
            Text(
              AppStrings.siteAddressLabelNC,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: 10),
            TextFormField(
              textInputAction: TextInputAction.next,
              controller: controller.siteUrl,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.language,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                hintText: AppStrings.siteHintTextNC,
              ),
<<<<<<< HEAD
              validator: (value) =>
                  value!.isEmpty ? 'Site address is required' : null,
            ),
            const SizedBox(height: 20),

            // 🔹 Username
=======
            ),
            const SizedBox(height: 20),
>>>>>>> 11329ca341e15bcebc644df914a1d8a6caffdbd3
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
<<<<<<< HEAD
              validator: (value) =>
                  value!.isEmpty ? 'Username is required' : null,
            ),
            const SizedBox(height: 20),

            // 🔹 Email
=======
            ),
            const SizedBox(height: 20),
>>>>>>> 11329ca341e15bcebc644df914a1d8a6caffdbd3
            Text(
              AppStrings.emailLabelNC,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: 10),
            TextFormField(
              textInputAction: TextInputAction.next,
<<<<<<< HEAD
              controller: controller.email,
=======
              controller: controller.emailId,
              obscureText: false,
>>>>>>> 11329ca341e15bcebc644df914a1d8a6caffdbd3
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.alternate_email,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                hintText: AppStrings.emailHintTextNC,
              ),
<<<<<<< HEAD
              validator: (value) => value!.isEmpty ? 'Email is required' : null,
            ),
            const SizedBox(height: 20),

            // 🔹 Phone Number
=======
            ),
            const SizedBox(height: 20),
>>>>>>> 11329ca341e15bcebc644df914a1d8a6caffdbd3
            Text(
              AppStrings.phoneNumberLabelNC,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: 10),
            TextFormField(
              textInputAction: TextInputAction.next,
              controller: controller.mobileNumber,
<<<<<<< HEAD
=======
              obscureText: false,
>>>>>>> 11329ca341e15bcebc644df914a1d8a6caffdbd3
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.call,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                hintText: AppStrings.phoneNumberHintTextNC,
              ),
<<<<<<< HEAD
              validator: (value) =>
                  value!.isEmpty ? 'Phone number is required' : null,
            ),
            const SizedBox(height: 20),

            // 🔹 Password
=======
            ),
            const SizedBox(height: 20),
>>>>>>> 11329ca341e15bcebc644df914a1d8a6caffdbd3
            Text(
              AppStrings.passwordAddressLabelNC,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: 10),
            TextFormField(
              textInputAction: TextInputAction.done,
              controller: controller.password,
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.lock_rounded,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                hintText: AppStrings.passwordHintTextNC,
              ),
<<<<<<< HEAD
              validator: (value) =>
                  value!.isEmpty ? 'Password is required' : null,
            ),
            const SizedBox(height: 20),

            // 🔹 Password Strength & Generate Button
=======
            ),
            const SizedBox(height: 20),
>>>>>>> 11329ca341e15bcebc644df914a1d8a6caffdbd3
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GeneratePasswordButton(),
                StrengthBadge(strength: 'Strong'),
              ],
            ),
            const SizedBox(height: 10),
<<<<<<< HEAD

            // 🔹 Reminder & Category Dropdowns
=======
>>>>>>> 11329ca341e15bcebc644df914a1d8a6caffdbd3
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
                        '60 Days'
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
<<<<<<< HEAD

            // 🔹 Save Button with Validation
            PrimaryButton(
              text: AppStrings.buttonSave,
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  controller.addCredential(); // Only save if the form is valid
=======
            PrimaryButton(
              text: AppStrings.buttonSave,
              onPressed: () {
                try {
                  controller.saveCredential(
                    controller.siteUrl.text,
                    controller.userName.text,
                    controller.emailId.text,
                    controller.password.text,
                    controller.mobileNumber.text,
                  );
                } catch (e) {
                  print(e.toString());
>>>>>>> 11329ca341e15bcebc644df914a1d8a6caffdbd3
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
