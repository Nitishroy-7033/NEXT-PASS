import '../../../../../core/constants/app_linker.dart';

class MobileMasterPasswordScreen extends StatelessWidget {
  final MasterPasswordController pinController = Get.put(MasterPasswordController());

  static const List<String> customIcons = [
    IconsAssets.rectangle_icon,
    IconsAssets.polygon_icon,
    IconsAssets.star_icon,
    IconsAssets.ellipse_icon,
  ];

  MobileMasterPasswordScreen({super.key});

  String getRandomIcon() {
    final random = Random();
    return customIcons[random.nextInt(customIcons.length)];
  }

  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // const Spacer(), // 🔥 Top space to push UI down

          // 🔹 Lock Icon
          Container(
            width: w / 4,
            height: w / 4,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryFixed,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: SvgPicture.asset(IconsAssets.second_lock_icon, width: w / 6, height: w / 6),
            ),
          ),
          const SizedBox(height: 20),

          // 🔹 Dynamic Heading (Create PIN / Re-enter / Enter M-PIN)
          Obx(() {
            String screenText;

            // ✅ Agar error message hai to wahi dikhayenge
            if (pinController.errorMessage.value.isNotEmpty) {
              screenText = pinController.errorMessage.value;
            } else if (pinController.isCreatingPin.value) {
              // ✅ PIN create kar rahe hain
              screenText = (pinController.tempPin.value == null)
                  ? "Create Master PIN"
                  : "Re-enter Master PIN";
            } else {
              // ✅ Login Mode (Enter Your M-PIN)
              screenText = "Enter Your M-PIN";
            }

            return Text(
              screenText,
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: pinController.errorMessage.value.isNotEmpty
                    ? Colors.red // ✅ Error hai to red color
                    : Theme.of(context).colorScheme.tertiary,
              ),
            );
          }),


          const SizedBox(height: 30),

          // 🔹 PIN Indicator Row
          Obx(() {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(pinController.pinLength, (index) {
                bool isFilled = index < pinController.enteredDigits.value.length;
                return Container(
                  width: w / 8,
                  height: w / 8,
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
                    getRandomIcon(),
                    width: 12,
                    height: 12,
                  )
                      : Container(),
                );
              }),
            );
          }),

          const SizedBox(height: 20),


          // 🔹 Custom Keyboard (Takes remaining space)
          CustomKeyboard(pinController: pinController),

          const SizedBox(height: 15),

          // 🔹 Forget PIN (Always Below Keyboard)
          Text(AppStrings.masterPasswordForgot,
              style: TextStyle(
                  fontSize: AppDimensions.fontSmall,
                  color: Theme.of(context).colorScheme.primaryFixed)),

          const SizedBox(height: 50),

          // 🔹 Privacy & Terms (Always Visible)
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
