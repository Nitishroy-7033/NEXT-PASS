import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:next_pass/core/utils/responsive.dart';

import '../../../../core/constants/app_colors.dart';

class WebHomeScreen extends StatelessWidget {
  const WebHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primaryLight,

      body: Center(child: Text("WEB Home Screen")),

    );
  }
}


