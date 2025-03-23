import '../../../../core/constants/app_linker.dart';

class MobileWelcomeScreen2 extends StatelessWidget {
  const MobileWelcomeScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5),
        Text(
          AppStrings.heading2,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        Image.asset(
          AppImageAssets.getStartedLogo2,
          height: 280,
        ),
        Text(
          AppStrings.content2,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ],
    );
  }
}
