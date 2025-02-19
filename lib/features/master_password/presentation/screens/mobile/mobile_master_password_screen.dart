


import '../../../../../core/constants/app_linker.dart';

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

   MobileMasterPasswordScreen({super.key});

  // 🔹 Function to get a random symbol
  String getRandomIcon() {
    final random = Random();
    return customIcons[random.nextInt(customIcons.length)];
  }

  @override
  Widget build(BuildContext context) {
      final double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 45,
            ),
            Container(
              width: w/4,
              height: w/4,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryFixed,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: SvgPicture.asset(IconsAssets.second_lock_icon,
                    width: w/6, height: w/6),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              AppStrings.masterPasswordSubtitle,
              style: Theme.of(context).textTheme.labelMedium
            ),
            const SizedBox(height: 40),
            Obx(() {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(pinController.pinLength, (index) {
                  bool isFilled = index < pinController.enteredPin.value.length;
                  return Container(
                    width: w/8,
                    height: w/8,
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
            /// Custom Keyboard
            CustomKeyboard(pinController: pinController),
            const SizedBox(height: 30 ),
        
            Text(AppStrings.masterPasswordForgot,
                style: TextStyle(
                    fontSize: AppDimensions.fontSmall,
                    color: Theme.of(context).colorScheme.primaryFixed)),
            const SizedBox(height: 20),
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
