import '../../../../../core/constants/app_linker.dart';

class PasswordField extends StatelessWidget {
  final TextEditingController passwordControllerText;
  final CredentialController credentialController;
  const PasswordField({
    super.key,
    required this.passwordControllerText,
    required this.credentialController,
  });

  @override
  Widget build(BuildContext context) {
    final PasswordController passwordController = Get.find();
    final CredentialController credentialController = Get.find();
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h), //
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Password",
                style: Theme.of(context).textTheme.labelMedium,
              ),
              StrengthBadge(
                strength: passwordController.checkandReturnPasswordStrength(
                    passwordControllerText.text),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Obx(
            () => TextFormField(
              controller: passwordControllerText,
              enabled: credentialController.isEditing.value,
              onChanged: (value) => credentialController.password.value = value,
              obscureText: !credentialController.isPasswordVisible.value,
              style: Theme.of(context).textTheme.bodyLarge,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.lock,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
                suffixIcon: Obx(
                  () => IconButton(
                    icon: SvgPicture.asset(
                      credentialController.isPasswordVisible.value
                          ? IconsAssets.eye_block_icon
                          : IconsAssets.eye_icon,
                      width: 15.w,
                      height: 15.w,
                      colorFilter: ColorFilter.mode(
                        Theme.of(context).colorScheme.onPrimaryContainer,
                        BlendMode.srcIn,
                      ),
                    ),
                    onPressed: credentialController.togglePasswordVisibility,
                  ),
                ),
                filled: true,
                fillColor: Theme.of(context).colorScheme.primaryContainer,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primaryContainer,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
