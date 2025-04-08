import '../../../../core/constants/app_linker.dart';

class MobileWelcomeScreen1 extends StatelessWidget {
  const MobileWelcomeScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Column(
        spacing: 26.h,
        children: [
          SizedBox(height: 5.h),
          Text(
            AppStrings.heading1,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          Image.asset(
            AppImageAssets.getStartedLogo1,
            height: 280.h,
          ),
          Text(
            AppStrings.content1,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }
}
