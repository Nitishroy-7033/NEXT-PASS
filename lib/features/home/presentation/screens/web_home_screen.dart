import 'package:flutter/material.dart';
import 'package:next_pass/core/constants/app_strings.dart';

import '../../../../core/constants/app_colors.dart';

class WebHomeScreen extends StatelessWidget {
  const WebHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.backgroundLight,

      body: Center(child: Text(AppStrings.buttonSubmit)),

    );
  }
}


