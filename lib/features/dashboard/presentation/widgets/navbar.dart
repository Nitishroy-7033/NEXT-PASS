import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:next_pass/features/dashboard/controllers/navbar_controller.dart';

import '../../../../core/constants/app_assets.dart';
import 'nav_bar_icon_button.dart';

class CustomNavBar extends StatelessWidget {

  CustomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        margin: const EdgeInsets.only(bottom: 10),
        width: 230,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(0.2),
            width: 1,
          ),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NavBarButton(icon: IconsAssets.homeIcon,index: 0,),
            NavBarButton(icon: IconsAssets.passwordIcon,index: 1,),
            NavBarButton(icon: IconsAssets.bookmarkIcon,index: 2,),
            NavBarButton(icon: IconsAssets.profileIcon,index: 3),
          ],
        ),
      );
  }
}
