import 'package:flutter/material.dart';
import 'package:next_pass/core/constants/app_assets.dart';
import 'package:next_pass/core/constants/app_colors.dart';
import 'package:next_pass/core/constants/app_themes.dart';
//import 'package:next_pass/core/constants/app_colors.dart';
import 'package:next_pass/core/utils/size_config.dart';
import 'package:next_pass/core/widgets/primary_button.dart';
import 'package:next_pass/features/getStarted/presentations/screens/mobile_welcome_screen1.dart';
import 'package:next_pass/features/getStarted/presentations/screens/mobile_welcome_screen2.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MobileGetStartedScreen extends StatelessWidget {
final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
     body: Stack(
          children: [
                 PageView(
                  controller: _controller,
                  children: [
                    MobileWelcomeScreen1(),
                    MobileWelcomeScreen2(),
                  ],
                  scrollDirection: Axis.horizontal,
                ),
          ],
     )
    );
  }
}
