
import 'package:flutter/material.dart';
import 'package:next_pass/features/splash/presentation/screens/mobile_splash_screen.dart';
import 'package:next_pass/features/splash/presentation/screens/web_splash_screen.dart';
import '../../../../core/utils/responsive.dart';

class SplaceView extends StatelessWidget {
  const SplaceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
        mobile: MobileSplashScreen(),
        tablet: MobileSplashScreen(),
        desktop: WebSplaceScreen());
  }
}
