import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:next_pass/core/constants/app_linker.dart';
import 'package:next_pass/features/master_password/presentation/widgets/custom_keyboard.dart';

class MobileMasterPasswordScreen extends StatefulWidget {
  @override
  _MobileMasterPasswordScreenState createState() => _MobileMasterPasswordScreenState();
}

class _MobileMasterPasswordScreenState extends State<MobileMasterPasswordScreen> with SingleTickerProviderStateMixin {
  final MasterPasswordController pinController = Get.put(MasterPasswordController());
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;

  static const List<String> customIcons = [
    IconsAssets.rectangle_icon, // Square for index 0
    IconsAssets.polygon_icon,  // Triangle for index 1
    IconsAssets.star_icon,      // Star for index 2
    IconsAssets.ellipse_icon,   // Circle for index 3
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  String getIconForIndex(int index) {
    return customIcons[index % customIcons.length];
  }

  void startAnimation() {
    _animationController.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: w / 4,
            height: w / 4,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryFixed,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: SvgPicture.asset(IconsAssets.second_lock_icon, width: w / 5, height: w / 5),
            ),
          ),
          const SizedBox(height: 20),

          Obx(() {
            String screenText;
            if (pinController.errorMessage.value.isNotEmpty) {
              screenText = pinController.errorMessage.value;
            } else if (pinController.isCreatingPin.value) {
              screenText = (pinController.tempPin.value == null)
                  ? "Create Master PIN"
                  : "Re-enter Master PIN";
            } else {
              screenText = "Enter Your M-PIN";
            }
            return Text(
              screenText,
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: pinController.errorMessage.value.isNotEmpty
                    ? Colors.red 
                    : Theme.of(context).colorScheme.tertiary,
              ),
            );
          }),

          const SizedBox(height: 30),

          Obx(() {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(pinController.pinLength, (index) {
                bool isFilled = index < pinController.enteredDigits.value.length;
                if (isFilled) {
                  startAnimation();
                }
                return Container(
                  width: w / 8,
                  height: w / 8,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.tertiary,
                      width: 1,
                    ),
                  ),
                  child: isFilled
                      ? AnimatedBuilder(
                          animation: _opacityAnimation,
                          builder: (context, child) {
                            return Opacity(
                              opacity: _opacityAnimation.value,
                              child: SvgPicture.asset(
                                getIconForIndex(index),
                                width: 12,
                                height: 12,
                              ),
                            );
                          },
                        )
                      : Container(),
                );
              }),
            );
          }),

          const SizedBox(height: 20),

          CustomKeyboard(pinController: pinController),

          const SizedBox(height: 15),

          Text(AppStrings.masterPasswordForgot,
              style: TextStyle(
                  fontSize: AppDimensions.fontSmall,
                  color: Theme.of(context).colorScheme.primaryFixed)),

          const SizedBox(height: 50),

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

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}