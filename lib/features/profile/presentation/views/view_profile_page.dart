
import 'package:next_pass/core/constants/app_linker.dart';
import 'package:next_pass/features/profile/presentation/screen/mobile_profile_page.dart';
import 'package:next_pass/features/profile/presentation/screen/web_profile_page.dart';

class ViewProfilePage extends StatelessWidget {
  const ViewProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
        mobile: MobileProfilePage(),
        tablet:  MobileProfilePage(),
        desktop: const WebProfilePage());
  }
}
