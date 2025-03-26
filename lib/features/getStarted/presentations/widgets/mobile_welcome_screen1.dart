import '../../../../core/constants/app_linker.dart';

class MobileWelcomeScreen1 extends StatelessWidget {
  const MobileWelcomeScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        spacing: 30,
        children: [
          const SizedBox(height: 5),
          Text(
            AppStrings.heading1,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          Image.asset(
            AppImageAssets.getStartedLogo1,
            height: 280,
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
