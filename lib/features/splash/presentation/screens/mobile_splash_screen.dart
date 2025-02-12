import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:next_pass/core/constants/app_assets.dart';
import 'package:next_pass/features/splash/presentation/getx/controllers/splash_controller.dart';

class MobileSplashScreen extends StatelessWidget {
  final  controller = Get.find<SplashController>();
  MobileSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          AnimationAssets.splashLockAnimation,
          width: 150,
          height: 150,
        ),
      ),
    );
  }
}
