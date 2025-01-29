import 'package:flutter/material.dart';
import 'package:next_pass/core/utils/responsive.dart';
import 'package:next_pass/features/not_found/presentation/screens/mobile_not_found_screen.dart';
import 'package:next_pass/features/not_found/presentation/screens/web_not_found_screen.dart';

class NotFoundView extends StatelessWidget {
  const NotFoundView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
        mobile: MobileNotFoundScreen(),
        tablet: MobileNotFoundScreen(),
        desktop: WebNotFoundScreen());
  }
}
