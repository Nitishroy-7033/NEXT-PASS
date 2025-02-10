import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:next_pass/core/constants/app_assets.dart';
import 'package:next_pass/features/master_password/presentation/getx/controller/master_password_controller.dart';

class CustomKeyboard extends StatelessWidget {
  final MasterPasswordController pinController;

  const CustomKeyboard({required this.pinController});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 2,
        ),
        itemCount: 12, // 0-9 + biometric + backspace button
        itemBuilder: (context, index) {
          Widget buttonContent;

          if (index == 9) {
            // ✅ Biometric Icon
            buttonContent = SvgPicture.asset(


              IconsAssets.biometric_icon,
              width: 20,
              height: 20,
            );
          } else if (index == 10) {
            // ✅ Zero button
            buttonContent = const Text(
              "0",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            );
          } else if (index == 11) {
            // ✅ Cross (❌) Backspace Icon
            buttonContent = SvgPicture.asset(
              IconsAssets.crossIcon,

              width: 20,
              height: 20,
            );
          } else {
            // ✅ Number Buttons (1-9)
            buttonContent = Text(
              (index + 1).toString(),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            );
          }

          return GestureDetector(
            onTap: () {
              if (index == 11) {
                pinController.removeDigit(); // Cross button action
              } else if (index != 9) {
                pinController.addDigit(index == 10 ? "0" : (index + 1).toString());
              }
            },
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                border: Border(
                  top: index < 3 ? BorderSide.none :  BorderSide(color: Theme.of(context).colorScheme.tertiary, width: 0),
                  left: index % 3 == 0 ? BorderSide.none :  BorderSide(color: Theme.of(context).colorScheme.tertiary, width: 0),
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
