import 'package:flutter/cupertino.dart';
import 'package:next_pass/core/utils/responsive.dart';
import 'package:next_pass/features/master_password/presentation/screens/mobile/mobile_master_password_screen.dart';
class MasterPasswordView extends StatelessWidget {
  const MasterPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
        mobile: MobileMasterPasswordScreen(),
        tablet:  MobileMasterPasswordScreen(),
        desktop:  MobileMasterPasswordScreen());
  }
}
