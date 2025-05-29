import 'package:next_pass/core/constants/app_linker.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PasswordController passwordController = Get.put(PasswordController());
    final RxBool isSecure = true.obs;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Change Password"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Old Password",
              style: Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(height: 10.h),
            Obx(
              () => TextFormField(
                textInputAction: TextInputAction.done,
                // controller: controller.password,
                obscureText: isSecure.value, // Toggle password visibility
                // onChanged: (value) {
                //   passwordController.checkPasswordStrength(value);
                // },
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
                validator: (value) => value!.isEmpty ? "Enter Password*" : null,
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              "New Password",
              style: Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(height: 10.h),
            Obx(
              () => TextFormField(
                textInputAction: TextInputAction.done,
                // controller: controller.password,
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
                validator: (value) => value!.isEmpty ? "Enter Password*" : null,
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              "Re-Enter New Password",
              style: Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(height: 10.h),
            Obx(
              () => TextFormField(
                textInputAction: TextInputAction.done,
                // controller: controller.password,
                obscureText: isSecure.value, // Toggle password visibility
                // onChanged: (value) {
                //   passwordController.checkPasswordStrength(value);
                // },
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
                validator: (value) => value!.isEmpty ? "Enter Password*" : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
