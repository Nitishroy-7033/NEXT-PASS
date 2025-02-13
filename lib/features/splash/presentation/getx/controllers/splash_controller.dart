import 'dart:async';
import 'package:get/get.dart';

import '../../../../../core/routes/app_routes.dart';
// Adjust the path as necessary

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigateToGetStarted();
  }

  void _navigateToGetStarted() {
    Timer(const Duration(seconds: 6), () {
      Get.offNamed(AppRoutes.authtab);
    });
  }
}
