
import '../../../../core/constants/app_linker.dart';

class WebSplaceScreen extends StatelessWidget {
  final SplashController controller = Get.put(SplashController());

  WebSplaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              AppImageAssets.appLogo, 
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 20),
            const Text(
              'Simplify Your Life, One Tap at a Time.',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
