import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:next_pass/features/dashboard/controllers/navbar_controller.dart';

import '../../../../core/constants/app_assets.dart';

class CustomNavBar extends StatelessWidget {
  final NavController navController = Get.put(NavController());

  CustomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(color: Colors.grey.shade600, blurRadius: 5),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              navController.navItem(0, IconsAssets.homeIcon),
              navController.navItem(1, IconsAssets.passwordIcon),
              navController.navItem(2, IconsAssets.settingsIcon),
              navController.navItem(3, IconsAssets.bookmarkIcon),
              navController.navItem(4, IconsAssets.profileIcon),
            ],
          ),
        ),
      ),
    );
  }
}
