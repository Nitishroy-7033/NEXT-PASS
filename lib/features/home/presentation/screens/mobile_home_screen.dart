import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class MobileHomeScreen extends StatelessWidget {
  const MobileHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundLight,
        body: Center(
            child: Text(
          "Mobile Home Screen djdk",
          style: TextStyle(fontSize: 23),
        )),
      ),
    );
  }
}
