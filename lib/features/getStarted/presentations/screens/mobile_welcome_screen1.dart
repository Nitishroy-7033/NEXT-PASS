
import '../../../../core/constants/app_linker.dart';

class MobileWelcomeScreen1 extends StatelessWidget {
  const MobileWelcomeScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = SizeConfig.screenHeight;
    final double width = SizeConfig.screenWidth;
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      body:  Padding(
          padding: const EdgeInsets.fromLTRB(51, 67, 49, 67),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      width * (24 / 393), 0, width * (21 / 393), 0),
                  child: Text(
                    AppStrings.heading1,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      width * (17 / 393), 0, width * (18 / 393), 0),
                  child: Image.asset(AppImageAssets.getStartedLogo1),
                ),
                const SizedBox(
                  height: 60,
                ),
                Text(AppStrings.content1,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineMedium),
               const SizedBox(
                  height: 250,
                ),
                PrimaryButton(text: "Start", onPressed: () {
                  Get.toNamed(AppRoutes.authtab);
                }),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Skip",
                      style: AppThemes.lightTheme.textTheme.bodyMedium,
                    )),
              ],
            ),
          ),
        ),
    );
  }
}
