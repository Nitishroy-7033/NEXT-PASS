import '../../../../../core/constants/app_linker.dart';

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
          SizedBox(height: 10.h),

          /// **Full Name**
          Row(
            children: [
              Text("Full Name", style: Theme.of(context).textTheme.labelMedium),
            ],
          ),
          SizedBox(height: 10.h),
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
              SizedBox(width: 10.w),
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
          SizedBox(height: 20.h),

          /// **Email**
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
              hintText: "user@gmail.com",
            ),
            validator: TextFieldValidators.validateEmail,
          ),
          SizedBox(height: 20.h),

          /// **Password**
          Row(
            children: [
              Text("Password", style: Theme.of(context).textTheme.labelMedium),
            ],
          ),
          SizedBox(height: 10.h),
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
          SizedBox(height: 20.h),

          /// **Error Message Display**
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

          /// **Signup Button**
          Obx(
            () => authController.isLoading.value
                ? const CircularProgressIndicator()
                : PrimaryButton(
                    text: "SIGNUP",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        authController.createAnAccount(
                            emailController.text,
                            passwordController.text,
                            firstNameController.text,
                            lastNameController.text);
                      }
                      FocusScope.of(context).unfocus();
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
