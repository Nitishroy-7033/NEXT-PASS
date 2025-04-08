import 'package:next_pass/core/constants/app_linker.dart';
import 'package:next_pass/features/master_password/presentation/widgets/create_master_pin.dart';
import 'package:next_pass/features/master_password/presentation/widgets/reenter_masterpassword.dart';

import '../../widgets/enter_master_pin.dart';

class MobileMasterPasswordScreen extends StatefulWidget {
  const MobileMasterPasswordScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MobileMasterPasswordScreenState createState() =>
      _MobileMasterPasswordScreenState();
}

class _MobileMasterPasswordScreenState extends State<MobileMasterPasswordScreen>
    with SingleTickerProviderStateMixin {
  final MasterPasswordController pinController =
      Get.put(MasterPasswordController());
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;
  RxBool showTransition = false.obs; // **Transition effect ke liye RxBool**

  static const List<String> customIcons = [
    IconsAssets.rectangle_icon, // Square for index 0
    IconsAssets.polygon_icon, // Triangle for index 1
    IconsAssets.star_icon, // Star for index 2
    IconsAssets.ellipse_icon, // Circle for index 3
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _opacityAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
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
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Column(
            children: [
              SizedBox(height: 80.h),
              Image.asset(
                AppImageAssets.appLogo,
                height: 85.h,
              ),
              SizedBox(height: 40.h),
              Obx(() {
                return AnimatedSwitcher(
                  duration:
                      const Duration(milliseconds: 200), // Transition duration
                  transitionBuilder: (widget, animation) {
                    return FadeTransition(
                      opacity: animation,
                      child: widget,
                    );
                  },
                  child: pinController.errorMessage.value.isNotEmpty
                      ? Text(
                          pinController.errorMessage.value,
                          key: const ValueKey('errorMessage'), // Unique Key
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    color: Theme.of(context).colorScheme.error,
                                  ),
                        )
                      : pinController.isCreatingPin.value
                          ? (pinController.tempPin.value == null)
                              ? CreateMasterPinWidget(
                                  key: const ValueKey('createMasterPin'))
                              : ReenterMasterPinWidget(
                                  key: const ValueKey('reenterMasterPin'))
                          : EnterMasterPinWidget(
                              key: const ValueKey('enterMasterPin')),
                );
              }),
              SizedBox(height: 50.h),
              Obx(() {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(pinController.pinLength, (index) {
                    bool isFilled =
                        index < pinController.enteredDigits.value.length;
                    if (isFilled) {
                      startAnimation();
                    }
                    return Container(
                      width: 50.w,
                      height: 50.w,
                      margin: EdgeInsets.symmetric(horizontal: 10.w),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        border: Border.all(
                          color: Theme.of(context)
                              .colorScheme
                              .tertiary
                              .withValues(alpha: 0.4),
                          width: 1.w,
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
                                    width: 12.w,
                                    height: 12.w,
                                  ),
                                );
                              },
                            )
                          : Container(),
                    );
                  }),
                );
              }),
              SizedBox(height: 30.h),
              CustomKeyboard(
                pinController: pinController,
                onPinEntered: () {
                  pinController.onPinEntered();
                },
              ),
              SizedBox(height: 30.h),
              GestureDetector(
                onTap: () {
                  pinController.resetMasterPin();
                },
                child: Text(
                  AppStrings.masterPasswordForgot,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    AppStrings.masterPasswordPrivacy,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Text(
                    AppStrings.masterPasswordTerms,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
