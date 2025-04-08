import 'package:next_pass/core/constants/biomatric_service.dart';

import '../../../../core/constants/app_linker.dart';

class CustomKeyboard extends StatelessWidget {
  final MasterPasswordController pinController;
  final VoidCallback? onPinEntered; // ✅ Add this

  const CustomKeyboard(
      {super.key, required this.pinController, this.onPinEntered});
  // ✅ Add this

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.w),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
      ),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.4,
        ),
        itemCount: 12,
        itemBuilder: (context, index) {
          Widget buttonContent;

          if (index == 9) {
            // ✅ Biometric Icon
            buttonContent = InkWell(
              onTap: () async {
                bool check = await BiomatricService().authenticateLocally();
                if (check) {
                  Get.offAllNamed(AppRoutes.home);
                }
              },
              child: SvgPicture.asset(
                IconsAssets.biometric_icon,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).colorScheme.onSurface,
                  BlendMode.srcIn,
                ),
                width: 20.w,
                height: 20.w,
              ),
            );
          } else if (index == 10) {
            // ✅ Zero button
            buttonContent = Text(
              "0",
              style: Theme.of(context).textTheme.headlineLarge,
            );
          } else if (index == 11) {
            // ✅ Cross (❌) Backspace Icon
            buttonContent = SvgPicture.asset(
              IconsAssets.crossIcon,
              colorFilter: ColorFilter.mode(
                Theme.of(context).colorScheme.onSurface,
                BlendMode.srcIn,
              ),
              width: 20.w,
              height: 20.w,
            );
          } else {
            // ✅ Number Buttons (1-9)
            buttonContent = Text(
              (index + 1).toString(),
              style: Theme.of(context).textTheme.headlineLarge,
            );
          }

          return GestureDetector(
            onTap: () {
              if (index == 11) {
                pinController.removeDigit(); // Cross button action
              } else if (index != 9) {
                pinController
                    .addDigit(index == 10 ? "0" : (index + 1).toString());
              }
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  top: index < 3
                      ? BorderSide.none
                      : BorderSide(
                          color: Theme.of(context)
                              .colorScheme
                              .tertiary
                              .withValues(alpha: 0.4),
                          width: 1),
                  left: index % 3 == 0
                      ? BorderSide.none
                      : BorderSide(
                          color: Theme.of(context)
                              .colorScheme
                              .tertiary
                              .withValues(alpha: 0.4),
                          width: 1),
                ),
              ),
              child: Center(child: buttonContent),
            ),
          );
        },
      ),
    );
  }
}
