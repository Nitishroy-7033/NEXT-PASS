import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:next_pass/core/constants/app_colors.dart';
import 'package:next_pass/features/home/presentation/screens/mobile_home_screen.dart';

class NavController extends GetxController {
  var selectedIndex = 0.obs;

  // List of pages
  final List pages = const [
    MobileHomeScreen(),
    Center(child: Text("Security")),
    Center(child: Text("Settings")),
    Center(child: Text("Bookmarks")),
    Center(child: Text("Profile")),
  ];

  // Method for chnage index
  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  // Method for Navbar Item
  Widget navItem(int index, String iconPath) {
    bool isSelected = selectedIndex.value == index;
    return GestureDetector(
      onTap: () => changeIndex(index),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          shape: BoxShape.rectangle,
          // ignore: deprecated_member_use
          color: isSelected ? Colors.blue.withOpacity(0.2) : Colors.transparent,
        ),
        child: SvgPicture.asset(
          iconPath,
          width: 28,
          height: 28,
          colorFilter: ColorFilter.mode(
            isSelected ? AppColors.primaryLight : Colors.grey,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
