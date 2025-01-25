import 'package:flutter/material.dart';
import 'package:next_pass/core/utils/responsive.dart';
import 'package:next_pass/presentation/pages/home/mobile_home_screen.dart';
import 'package:next_pass/presentation/pages/home/web_home_screen.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: MobileHomeScreen(),
      tablet: MobileHomeScreen(),
      desktop: WebHomeScreen(),
    );
  }
}
