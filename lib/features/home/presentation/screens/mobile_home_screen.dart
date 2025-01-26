import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class MobileHomeScreen extends StatelessWidget {
  const MobileHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(child: Text("Mobile Home Screen",style: TextStyle(fontSize: 23),)),
     
     
    
    );
  }
}
