
import 'package:flutter/material.dart';
import 'package:next_pass/features/splace/presentation/screens/mobile_splace_screen.dart';
import 'package:next_pass/features/splace/presentation/screens/web_splace_screen.dart';
import '../../../../core/utils/responsive.dart';

class SplaceView extends StatelessWidget {
  const SplaceView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
        mobile: MobileSplaceScreen(),
        tablet: MobileSplaceScreen(),
        desktop: WebSplaceScreen());
  }
}
