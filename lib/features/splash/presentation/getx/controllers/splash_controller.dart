import 'dart:async';
import 'package:get/get.dart';
import 'package:next_pass/features/home/presentation/screens/mobile_home_screen.dart';
 // Adjust the path as necessary

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigateToGetStarted();
  }

  void _navigateToGetStarted() {
    Timer(const Duration(seconds: 3), () {
      Get.offNamed('/getStarted');
    });
  }
}