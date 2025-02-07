import 'package:flutter/material.dart';
import 'package:next_pass/core/constants/app_assets.dart';
//import 'package:next_pass/core/constants/app_colors.dart';
import 'package:next_pass/core/constants/app_strings.dart';
import 'package:next_pass/core/utils/size_config.dart';
import 'package:next_pass/core/widgets/primary_button.dart';

class MobileGetStartedScreen extends StatelessWidget {
  const MobileGetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
     return Scaffold(
        backgroundColor: Color.fromARGB(255, 12, 15, 39),
        body:  SingleChildScrollView(
          child: Expanded(
            child: Padding(
               padding: EdgeInsets.fromLTRB(SizeConfig.screenWidth*0.08974358974, 
                        SizeConfig.screenHeight*0.04146919431, 
                        SizeConfig.screenWidth*0.08974358974, 
                        SizeConfig.screenHeight*0.04146919431,),
              child: Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                         Container(
                          width: SizeConfig.screenWidth*0.82307692307,
                          height: SizeConfig.screenHeight*0.52132701421,
                          child: Image.asset(
                            AppImageAssets.getStarted,
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(height: SizeConfig.screenHeight*0.02962085308,),
                        Container(
                          padding: EdgeInsets.fromLTRB(SizeConfig.screenWidth*(49/390), SizeConfig.screenHeight*(12/844), SizeConfig.screenWidth*(49/390), SizeConfig.screenHeight*(12/844)),
                          alignment: Alignment.center,
                          child: Text(
                            AppStrings.privacy,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: SizeConfig.screenHeight*0.04739336492,
                                fontFamily: "Montserrat"),
                                 textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: SizeConfig.screenHeight*(75/844),),
                         PrimaryButton(text: 'Register', onPressed: (){}),
                         SizedBox(height: SizeConfig.screenHeight*(30/844),),
                         PrimaryButton(text: 'Already have an account ?', onPressed: (){}),
                    ],
                  ),
              ),
            ),
          ),
        ),
        );
  }
}
