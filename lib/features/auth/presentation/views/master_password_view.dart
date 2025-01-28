import 'package:flutter/cupertino.dart';
import 'package:next_pass/core/utils/responsive.dart';
import 'package:next_pass/features/auth/presentation/screens/mobile/mobile_master_password_screen.dart';
import 'package:next_pass/features/auth/presentation/screens/web/web_master_password_screen.dart';
import 'package:next_pass/features/home/presentation/screens/mobile_home_screen.dart';
import 'package:next_pass/features/home/presentation/screens/web_home_screen.dart';

class MasterPasswordView extends StatelessWidget {
  const MasterPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
        mobile: MobileMasterPasswordScreen(),
        tablet: WebMasterPasswordScreen(),
        desktop: WebMasterPasswordScreen());
  }
}
