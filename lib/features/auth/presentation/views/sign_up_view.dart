import 'package:flutter/cupertino.dart';
import 'package:next_pass/core/utils/responsive.dart';
import 'package:next_pass/features/auth/presentation/screens/mobile/mobile_sign_up_Screen.dart';
import 'package:next_pass/features/auth/presentation/screens/tab/tab_sign_up_screen.dart';
import 'package:next_pass/features/auth/presentation/screens/web/web_sign_up_screen.dart';
import 'package:next_pass/features/home/presentation/screens/mobile_home_screen.dart';
import 'package:next_pass/features/home/presentation/screens/web_home_screen.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
        mobile: MobileSignUpScreen(),
        tablet: TabSignUpScreen(),
        desktop: WebSignUpScreen());
  }
}
