import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:next_pass/core/constants/app_assets.dart';
import 'package:next_pass/features/splash/presentation/getx/controllers/splash_controller.dart';

class MobileSplashScreen extends StatelessWidget {
  final SplashController controller = Get.put(SplashController());

  MobileSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImageAssets.appLogo, // Replace with your animated image
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 20),
            Text(
              'Simplify Your Life, One Tap at a Time.',
              style: Theme.of(context).textTheme.bodyLarge
            ),
          ],
        ),
      ),
    );
  }
}
