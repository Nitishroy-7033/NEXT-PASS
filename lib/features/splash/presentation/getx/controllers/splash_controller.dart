import 'dart:async';
import 'package:get/get.dart';
import 'package:next_pass/features/home/presentation/screens/mobile_home_screen.dart';
 // Adjust the path as necessary

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigateToHome();
  }

  void _navigateToHome() {
    Timer(const Duration(seconds: 5), () {
      Get.offNamed('/home');
    });
  }
}