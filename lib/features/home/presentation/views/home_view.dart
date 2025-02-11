
import '../../../../core/constants/app_linker.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Responsive(
        mobile: MobileHomeScreen(),
        tablet: WebHomeScreen(),
        desktop: WebHomeScreen());
  }
}
