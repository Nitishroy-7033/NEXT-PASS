

import '../../../../core/constants/app_linker.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({super.key});

  @override
  Widget build(BuildContext context) {
     return Responsive(
        mobile: MobileGetStartedScreen(),
        tablet: MobileGetStartedScreen(),
        desktop: WebGetStartedScreen());
  }
}