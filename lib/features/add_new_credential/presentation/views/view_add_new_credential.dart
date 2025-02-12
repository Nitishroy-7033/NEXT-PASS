
import 'package:next_pass/core/constants/app_linker.dart';

class ViewAddNewCredential extends StatelessWidget {
  const ViewAddNewCredential({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
        mobile: MobileAddNewCredential(),
        tablet: MobileAddNewCredential(),
        desktop: WebAddNewCredential());
  }
}
