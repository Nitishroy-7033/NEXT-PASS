import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/constants/app_linker.dart';
import '../../../../../core/utils/validators.dart';
import '../../../controllers/auth_controller.dart';

class MobileLoginScreen extends StatelessWidget {
  MobileLoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final AuthController authController = Get.put(AuthController());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final RxBool isSecure = true.obs;
  final RxBool rememberMe = true.obs;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(height: 10),
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
              hintText: "example@gmail.com",
            ),
            validator: TextFieldValidators.validateEmail,
          ),

          const SizedBox(height: 20),

          // Password Label
          Row(
            children: [
              Text("Password", style: Theme.of(context).textTheme.labelMedium),
            ],
          ),
          const SizedBox(height: 20),

          // Password TextFormField with Validator
          Obx(() => TextFormField(
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
              )),

          const SizedBox(height: 10),

          // Remember Me Checkbox
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Obx(() => Checkbox(
                    value: rememberMe.value,
                    onChanged: (value) {
                      rememberMe.value = value!;
                    },
                  )),
              const SizedBox(width: 10),
              Text("Remember Me",
                  style: Theme.of(context).textTheme.labelMedium),
            ],
          ),

          // Error Message Display
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

          // Login Button
          Obx(() => authController.isLoading.value
              ? const CircularProgressIndicator()
              : PrimaryButton(
                  text: "LOGIN",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      authController.login(
                        emailController.text,
                        passwordController.text,
                        true,
                      );
                    }
                  },
                )),
        ],
      ),
    );
  }
}
