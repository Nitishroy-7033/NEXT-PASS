import 'package:flutter/material.dart';
import 'package:next_pass/core/constants/app_assets.dart';
import 'package:next_pass/core/constants/app_colors.dart';
import 'package:next_pass/core/constants/app_strings.dart';
import 'package:next_pass/core/constants/app_themes.dart';
import 'package:next_pass/core/utils/size_config.dart';
import 'package:next_pass/core/widgets/primary_button.dart';

class MobileWelcomeScreen1 extends StatelessWidget {
  const MobileWelcomeScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = SizeConfig.screenHeight;
    final double width = SizeConfig.screenWidth;
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            51, //width*0.12977099236,
            67, //height*0.10211267605,
            49, //width*0.12468193384,
            67, //height*0.07863849765
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                    width * (24 / 393), 0, width * (21 / 393), 0),
                child: Text(
                  AppStrings.heading1,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
              SizedBox(
                height: height * (41 / 852),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                    width * (17 / 393), 0, width * (18 / 393), 0),
                child: Image.asset(AppImageAssets.getStartedLogo1),
              ),
              SizedBox(
                height: height * (51 / 852),
              ),
              Text(AppStrings.content1,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall),
              SizedBox(
                height: SizeConfig.screenHeight * (36 / 852),
              ),
              PrimaryButton(text: "Start", onPressed: () {}),
              SizedBox(
                height: SizeConfig.screenHeight * (30 / 852),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Skip",
                    style: AppThemes.lightTheme.textTheme.headlineSmall,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
