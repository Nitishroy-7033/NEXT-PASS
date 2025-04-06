import '../../../../../core/constants/app_linker.dart';

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
          SizedBox(height: 10.h),
          Row(
            children: [
              Text("Email", style: Theme.of(context).textTheme.labelMedium),
            ],
          ),
          SizedBox(height: 10.h),
          TextFormField(
            controller: emailController,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.alternate_email),
              hintText: "example@gmail.com",
            ),
            validator: TextFieldValidators.validateEmail,
          ),
          SizedBox(height: 20.h),
          // Password Label
          Row(
            children: [
              Text("Password", style: Theme.of(context).textTheme.labelMedium),
            ],
          ),
          SizedBox(height: 20.h),
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
          SizedBox(height: 10.h),
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
              SizedBox(width: 10.w),
              Text("Remember Me",
                  style: Theme.of(context).textTheme.labelMedium),
            ],
          ),
          // Error Message Display
          Obx(() => authController.isError.value
              ? Row(
                  children: [
                    const Icon(Icons.error, color: Colors.red),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Text(
                        authController.errorMessage.value,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: Colors.red),
                      ),
                    ),
                  ],
                )
              : const SizedBox()),
          SizedBox(height: 10.h),
          // Login Button
          Obx(
            () => authController.isLoading.value
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
                  ),
          ),
        ],
      ),
    );
  }
}
