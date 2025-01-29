import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:next_pass/core/constants/app_assets.dart';
import 'package:next_pass/core/constants/app_colors.dart';
import 'package:next_pass/core/constants/app_strings.dart';
import 'package:next_pass/core/utils/size_config.dart';

class MobileGetStartedScreen extends StatelessWidget {
  const MobileGetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
        backgroundColor: AppColors.fontLight,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //SizedBox(height: SizeConfig.screenHeight*0.00001,),
            Image.asset(
              AppImageAssets.getStarted,
              height: SizeConfig.screenHeight * 0.5,
              width: SizeConfig.screenWidth * 0.95,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: const Text(
                  AppStrings.privacy,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      backgroundColor: Colors.blue,
                    ),
                    child: const Text(
                      'Get Started',
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Image.asset(
                    IconsAssets.googleIcon,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Image.asset(
                    IconsAssets.facebookIcon,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
