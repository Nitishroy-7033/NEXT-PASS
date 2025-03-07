import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:next_pass/core/utils/validators.dart';
import '../../../../../core/constants/app_linker.dart';
import '../../../controllers/auth_controller.dart';

class MobileSignUpScreen extends StatelessWidget {
  MobileSignUpScreen({super.key});

  final AuthController authController = Get.put(AuthController());
  final _formKey = GlobalKey<FormState>();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final RxBool isSecure = true.obs;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(height: 10),

          /// **Full Name**
          Row(
            children: [
              Text("Full Name", style: Theme.of(context).textTheme.labelMedium),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: firstNameController,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(hintText: "First Name"),
                  validator: TextFieldValidators.requiredField,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextFormField(
                  controller: lastNameController,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(hintText: "Last Name"),
                  validator: TextFieldValidators.requiredField,
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          /// **Email**
          Row(
            children: [
              Text("Email", style: Theme.of(context).textTheme.labelMedium),
            ],
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: emailController,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.alternate_email),
              hintText: "user@gmail.com",
            ),
            validator: TextFieldValidators.validateEmail,
          ),

          const SizedBox(height: 20),

          /// **Password**
          Row(
            children: [
              Text("Password", style: Theme.of(context).textTheme.labelMedium),
            ],
          ),
          const SizedBox(height: 10),
          Obx(
            () => TextFormField(
              controller: passwordController,
              textInputAction: TextInputAction.done,
              obscureText: isSecure.value,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.password),
                hintText: "**********",
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
              ),
              validator: TextFieldValidators.validatePassword,
            ),
          ),

          const SizedBox(height: 20),

          /// **Error Message Display**
          Obx(() => authController.isError.value
              ? Row(
                  children: [
                    const Icon(Icons.error, color: Colors.red),
                    const SizedBox(width: 10),
                    Text(
                      authController.errorMessage.value,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: Colors.red),
                    ),
                  ],
                )
              : const SizedBox()),

          const SizedBox(height: 10),

          /// **Signup Button**
          Obx(
            () => authController.isLoading.value
                ? const CircularProgressIndicator()
                : PrimaryButton(text: "SIGNUP", onPressed: (){
                      // if (_formKey.currentState!.validate()) {
                       
                      // }

                authController.createAnAccount(emailController.text,
                    passwordController.text, firstNameController.text, lastNameController.text);

                    }, ),
          ),
        ],
      ),
    );
  }
}
