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
    final double w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
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
            const SizedBox(height: 15),
           
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
                    child: SvgPicture.asset(IconsAssets.second_lock_icon,
                        width: w / 5, height: w / 5),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            Obx(() {
              return AnimatedSwitcher(
                duration:
                    const Duration(milliseconds: 400), // Transition duration
                transitionBuilder: (widget, animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: widget,
                  );
                },
                child: pinController.errorMessage.value.isNotEmpty
                    ? Text(
                        pinController.errorMessage.value,
                        key: ValueKey('errorMessage'), // Unique Key
                        style: Theme.of(context).textTheme.labelMedium!.copyWith(
                              color: Colors.red,
                            ),
                      )
                    : pinController.isCreatingPin.value
                        ? (pinController.tempPin.value == null)
                            ? CreateMasterPinWidget(
                                key: ValueKey('createMasterPin'))
                            : ReenterMasterPinWidget(
                                key: ValueKey('reenterMasterPin'))
                        : EnterMasterPinWidget(key: ValueKey('enterMasterPin')),
              );
            }),
            const SizedBox(height: 30),
            
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
                    width: w / 8,
                    height: w / 8,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.tertiary.withValues(alpha: 0.4),
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
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    pinController.resetMasterPin();
                  },
                  child: Text(AppStrings.masterPasswordForgot,
                      style: TextStyle(
                          fontSize: AppDimensions.fontSmall,
                          color: Theme.of(context).colorScheme.primaryFixed)),
                ),
              ],
            ),
            CustomKeyboard(
              pinController: pinController,
              onPinEntered: () {
                pinController.onPinEntered();
              },
            ),
          ],
        ),
      ),
    );
  }
}
