import '../../../../../core/constants/app_linker.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigateToGetStarted();
  }

  void _navigateToGetStarted() {
    Timer(const Duration(seconds: 5), () {
      Get.offNamed(AppRoutes.getStarted);
    });
  }
}
