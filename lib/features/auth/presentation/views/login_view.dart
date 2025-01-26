import 'package:flutter/cupertino.dart';
import 'package:next_pass/core/utils/responsive.dart';
import 'package:next_pass/features/auth/presentation/screens/mobile/mobile_login_screen.dart';
import 'package:next_pass/features/home/presentation/screens/mobile_home_screen.dart';
import 'package:next_pass/features/home/presentation/screens/web_home_screen.dart';

import '../screens/tab/tab_login_screen.dart';
import '../screens/web/web_login_screen.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
        mobile: MobileLoginScreen(),
        tablet: TabLoginScreen(),
        desktop: WebLoginScreen());
  }
}
