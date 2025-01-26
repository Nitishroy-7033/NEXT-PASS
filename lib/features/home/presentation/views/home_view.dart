import 'package:flutter/cupertino.dart';
import 'package:next_pass/core/utils/responsive.dart';
import 'package:next_pass/features/home/presentation/screens/mobile_home_screen.dart';
import 'package:next_pass/features/home/presentation/screens/web_home_screen.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
        mobile: MobileHomeScreen(),
        tablet: WebHomeScreen(),
        desktop: WebHomeScreen());
  }
}
