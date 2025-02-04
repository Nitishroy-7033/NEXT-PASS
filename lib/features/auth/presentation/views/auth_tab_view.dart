import 'package:flutter/material.dart';
import 'package:next_pass/core/utils/responsive.dart';
import 'package:next_pass/features/auth/presentation/screens/mobile/auth_tab.dart';

class AuthTabView extends StatelessWidget {
  const AuthTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Responsive(mobile: AuthScreen(), tablet: AuthScreen(), desktop: AuthScreen());
  }
}