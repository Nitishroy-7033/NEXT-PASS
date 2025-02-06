import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:next_pass/core/constants/app_assets.dart';
import 'package:next_pass/core/widgets/sidebar%20for%20web/sidebar_tab.dart';
import 'package:next_pass/features/home/controller/web_sidebar_controller.dart';

class WebSidebar extends StatelessWidget {
  const WebSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    final sidebarController = Get.put(WebSidebarController());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 16),
      child: Obx(
        () => Column(
          children: [
            SidebarTab(
              icon: IconsAssets.homeIcon,
              title: 'Home',
              onTap: () => sidebarController.setIndex(0),
              isSelected: sidebarController.selectedIndex.value == 0,
            ),
            SidebarTab(
              icon: IconsAssets.securityIcon,
              title: 'Protection',
              onTap: () => sidebarController.setIndex(1),
              isSelected: sidebarController.selectedIndex.value == 1,
            ),
            SidebarTab(
              icon: IconsAssets.bookmarkIcon,
              title: 'Bookmarks',
              onTap: () => sidebarController.setIndex(2),
              isSelected: sidebarController.selectedIndex.value == 2,
            ),
            SidebarTab(
              icon: IconsAssets.personProfileIcon,
              title: 'Account',
              onTap: () => sidebarController.setIndex(3),
              isSelected: sidebarController.selectedIndex.value == 3,
            ),
            SidebarTab(
              icon: IconsAssets.settingsIcon,
              title: 'Settings',
              onTap: () => sidebarController.setIndex(4),
              isSelected: sidebarController.selectedIndex.value == 4,
            ),
          ],
        ),
      ),
    );
  }
}
