import 'package:flutter/widgets.dart';
import 'package:next_pass/core/utils/responsive.dart';
import 'package:next_pass/features/getStarted/presentations/screens/mobile_get_started_screen.dart';
import 'package:next_pass/features/getStarted/presentations/screens/web_get_started_screen.dart';

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