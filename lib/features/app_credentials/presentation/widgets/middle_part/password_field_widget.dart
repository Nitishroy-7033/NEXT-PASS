import 'package:next_pass/core/constants/app_linker.dart';

class PasswordField extends StatelessWidget {
  final TextEditingController passwordController;
  final CredentialController controller;

  const PasswordField({
    super.key,
    required this.passwordController,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),  // 
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppStrings.password,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Obx(() {
                  String strength = controller.getPasswordStrength();
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        strength,
                        style: TextStyle(
                          color: strength == AppStrings.weakText
                              ? AppColors.lightred
                              : strength == AppStrings.mediumText
                                  ? AppColors.orangeColor
                                  : AppColors.lightGreen,
                        ),
                      ),
                      const SizedBox(width: 5),
                      if (strength == AppStrings.weakText)
                        SvgPicture.asset(
                          IconsAssets.warning_icon,
                          height: 15,
                          width: 15,
                          color: AppColors.lightred,
                        ),
                      if (strength == AppStrings.strongText)
                        SvgPicture.asset(
                          IconsAssets.strongPasswordIcon,
                          width: 16,
                          height: 16,
                          colorFilter: const ColorFilter.mode(
                            AppColors.greenColor,
                            BlendMode.srcIn,
                          ),
                        ),
                    ],
                  );
                }),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Obx(() => TextFormField(
                controller: passwordController,
                onChanged: (value) => controller.password.value = value,
                obscureText: !controller.isPasswordVisible.value,
                style: Theme.of(context).textTheme.bodyLarge,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock,
                      color: Theme.of(context).colorScheme.onPrimaryContainer),
                  suffixIcon: IconButton(
                    icon: SvgPicture.asset(
                      controller.isPasswordVisible.value
                          ? IconsAssets.eye_block_icon
                          : IconsAssets.eye_icon,
                      width: 15,
                      height: 15,
                      colorFilter: ColorFilter.mode(
                          Theme.of(context).colorScheme.onPrimaryContainer,
                          BlendMode.srcIn),
                    ),
                    onPressed: controller.togglePasswordVisibility,
                  ),
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.primaryContainer,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
              )),
          Obx(() {
            return controller.getPasswordStrength() == AppStrings.weakText
                ? const WeakPasswordAlert()
                : const SizedBox();
          }),
        ],
      ),
    );
  }
}
