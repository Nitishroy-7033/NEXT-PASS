

import '../../../../core/constants/app_linker.dart';

class SplaceView extends StatelessWidget {
  const SplaceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
        mobile: MobileSplashScreen(),
        tablet: MobileSplashScreen(),
        desktop: WebSplaceScreen());
  }
}
