

import '../../../../core/constants/app_linker.dart';

class WebGetStartedScreen extends StatelessWidget {
  const WebGetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
        backgroundColor: AppColors.fontLight,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: SizeConfig.screenHeight * 0.0001,
            ),
            Image.asset(AppImageAssets.getStarted),
            SizedBox(
              height: SizeConfig.screenHeight * 0.35,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                backgroundColor: Colors.blue,
              ),
              child: const Text(
                'Get Started',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ],
        ));
  }
}
