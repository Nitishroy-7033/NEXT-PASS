import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:next_pass/features/home/presentation/screens/mobile_home_screen.dart';

class NavBarController extends GetxController {
  var selectedIndex = 0.obs;

  final List<Widget> pages = const [
    MobileHomeScreen(),
    Center(child: Text('Generate Password Screen')),
    Center(child: Text('Add Screen')),
    Center(child: Text('Settings')),
  ];

  void changeTab(int index) {
    selectedIndex.value = index;
  }
}
