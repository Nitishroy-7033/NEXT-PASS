import 'package:flutter/cupertino.dart';
import 'package:next_pass/core/utils/responsive.dart';
import 'package:next_pass/features/auth/presentation/screens/mobile/mobile_sign_up_Screen.dart';
import 'package:next_pass/features/auth/presentation/screens/web/web_sign_up_screen.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
        mobile: MobileSignUpScreen(),
        tablet: WebSignUpScreen(),
        desktop: WebSignUpScreen());
  }
}
