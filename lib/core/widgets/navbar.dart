import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:next_pass/core/constants/app_strings.dart';
import 'package:next_pass/features/auth/presentation/getx/controllers/navbar_controller.dart';

class Navbar extends StatelessWidget {
  final NavBarController navBarController = Get.put(NavBarController());

  Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
        currentIndex: navBarController.selectedIndex.value,
        onTap: navBarController.changeTab,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        elevation: 1,
        backgroundColor: Colors.white,
        landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
        items: [
          navBarController.navbarItems(
            const Icon(Icons.home_outlined),
            AppStrings.navHomeTitle,
          ),
          navBarController.navbarItems(
            const Icon(Icons.key_outlined),
            AppStrings.navGenerateTitle,
          ),
          navBarController.navbarItems(
            const Icon(Icons.add),
            AppStrings.navAddTitle,
          ),
          navBarController.navbarItems(
            const Icon(Icons.settings_outlined),
            AppStrings.navSettingsTitle,
          ),
        ],
      ),
    );
  }
}
