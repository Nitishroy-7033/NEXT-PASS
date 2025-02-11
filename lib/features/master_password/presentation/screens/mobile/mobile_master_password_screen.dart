import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:next_pass/core/constants/app_assets.dart';
import 'package:next_pass/core/constants/app_dimensions.dart';
import 'package:next_pass/core/constants/app_strings.dart';
import '../../getx/controller/master_password_controller.dart';
import '../../widgets/custom_keyboard.dart';

class MobileMasterPasswordScreen extends StatelessWidget {
  final MasterPasswordController pinController =
  Get.put(MasterPasswordController());


  // 🔹 Custom SVG Icons List
  static const List<String> customIcons = [
    IconsAssets.rectangle_icon,
    IconsAssets.polygon_icon,
    IconsAssets.star_icon,
    IconsAssets.ellipse_icon,
  ];

  // 🔹 Function to get a random symbol
  String getRandomIcon() {
    final random = Random();
    return customIcons[random.nextInt(customIcons.length)];
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 45,),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryFixed,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: SvgPicture.asset(
                  IconsAssets.second_lock_icon,
                  width: 24,
                  height: 24,

                // Monochrome color support
                ),
              ),
            ),

            const SizedBox(
              height: 23,
            ),
            Text(
              AppStrings.masterPasswordSubtitle,
              style: TextStyle(
                  fontSize: AppDimensions.fontSmall,

                  color: Theme.of(context).colorScheme.tertiary),
            ),
            const SizedBox(height: 23),


            Obx(() {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(pinController.pinLength, (index) {
                  bool isFilled = index < pinController.enteredPin.value.length;

                  return Container(
                    width: 40,
                    height: 40,
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.tertiary,
                        width: 0,
                      ),
                    ),
                    child: isFilled
                        ? SvgPicture.asset(
                      getRandomIcon(), // ✅ Random icon
                      width: 12,
                      height: 12,
                    )
                        : Container(), // Empty state
                  );
                }),
              );
            }),

            const SizedBox(height: 40),

            /// Custom Keyboard
            CustomKeyboard(pinController: pinController),
            const SizedBox(
              height: 43,
            ),

            Text(AppStrings.masterPasswordForgot,
                style: TextStyle(
                    fontSize: AppDimensions.fontSmall,
                    color: Theme.of(context).colorScheme.primaryFixed)),
            const SizedBox(
              height: 23,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(AppStrings.masterPasswordPrivacy,
                    style: TextStyle(
                        fontSize: AppDimensions.fontSmall,
                        color: Theme.of(context).colorScheme.tertiary)),
                Text(AppStrings.masterPasswordTerms,
                    style: TextStyle(
                        fontSize: AppDimensions.fontSmall,
                        color: Theme.of(context).colorScheme.tertiary)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
