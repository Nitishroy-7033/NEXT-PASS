import '../../../../core/constants/app_linker.dart';

class MobileSplashScreen extends StatelessWidget {
  final controller = Get.find<SplashController>();
  MobileSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          AnimationAssets.splashLockAnimation,
          width: 150.w,
          height: 150.w,
        ),
      ),
    );
  }
}
