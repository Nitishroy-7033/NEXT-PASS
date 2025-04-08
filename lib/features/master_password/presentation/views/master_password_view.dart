
import '../../../../core/constants/app_linker.dart';

class MasterPasswordView extends StatelessWidget {
  const MasterPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
        mobile: MobileMasterPasswordScreen(),
        tablet:  MobileMasterPasswordScreen(),
        desktop:  MobileMasterPasswordScreen());
  }
}
