import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:next_pass/features/dashboard/controllers/navbar_controller.dart';

class NavBarButton extends StatelessWidget {
  final String icon;
  final int index;
  const NavBarButton({super.key, required this.icon, required this.index});

  @override
  Widget build(BuildContext context) {
    final NavController navController = Get.put(NavController());
    return InkWell(
      onTap: () {
        navController.selectedIndex.value = index;
      },
      child: Obx(()=>AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInBack,
        height: 40,
        width: 40,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: navController.selectedIndex.value == index
              ? Theme.of(context).colorScheme.primary.withOpacity(0.3)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: SvgPicture.asset(
            icon,
            color: navController.selectedIndex.value == index
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.onSecondaryContainer,
          ),
        ),
      ),)
    );
  }
}
