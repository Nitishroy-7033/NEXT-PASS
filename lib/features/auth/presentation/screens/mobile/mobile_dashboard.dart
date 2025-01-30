import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:next_pass/core/constants/app_strings.dart';
import 'package:next_pass/features/auth/presentation/getx/controllers/navbar_controller.dart';

class MobileDashboard extends StatelessWidget {
  const MobileDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final NavBarController navBarController = Get.put(NavBarController());

    return Scaffold(
      body: Obx(
          () => navBarController.pages[navBarController.selectedIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: navBarController.selectedIndex.value,
          onTap: navBarController.changeTab,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          elevation: 1,
          backgroundColor: Colors.white,
          landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: AppStrings.navHomeTitle,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.key_outlined),
              label: AppStrings.navGenerateTitle,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: AppStrings.navAddTitle,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label: AppStrings.navSettingsTitle,
            ),
          ],
        ),
      ),
    );
  }
}
