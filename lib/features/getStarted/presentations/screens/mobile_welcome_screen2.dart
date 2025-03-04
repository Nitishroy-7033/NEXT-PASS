import 'package:next_pass/features/auth/controllers/auth_controller.dart';

import '../../../../core/constants/app_linker.dart';

class MobileWelcomeScreen2 extends StatelessWidget {
  const MobileWelcomeScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController =  Get.find<AuthController>();
      final double height = SizeConfig.screenHeight;
    final double width = SizeConfig.screenWidth;
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
                51,//width*0.12977099236,
                67,//height*0.10211267605,
                49,//width*0.12468193384,
                67,//height*0.07863849765
                ),
            child: Column(
                    children: [
                      Padding(
                          padding: EdgeInsets.fromLTRB(width*(24/393), 0, width*(21/393), 0),
                          child: Text(AppStrings.heading2,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                            color: Colors.black
                          ),),
                        ),
            
                      SizedBox(height: height*(41/852),),
            
                      Padding(
                         padding: EdgeInsets.fromLTRB(width*(17/393), 0, width*(18/393), 0),
                          child: Image.asset(AppImageAssets.getStartedLogo2),
                        ),
            
                      SizedBox(height: height*(51/852),),
            
                      Text(AppStrings.content1,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Colors.black
                        )),
                         SizedBox(height: SizeConfig.screenHeight*(36/852),),
                        PrimaryButton(text: "Start", onPressed: (){
                          Get.offAllNamed(AppRoutes.authtab);
                        }),
                         SizedBox(height: SizeConfig.screenHeight*(30/852),),
                         TextButton(onPressed: (){}, child: Text("Skip",style: AppThemes.lightTheme.textTheme.headlineSmall,)),
                    ],
                  ),
          ),
        ),
    );
  }
}