import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:next_pass/features/home/presentation/views/home_view.dart';

class WebSidebarController extends GetxController {
  RxInt selectedIndex = 0.obs;

  void setIndex(int value) {
    selectedIndex.value = value;
  }

  final List<Widget> webPages = const [
    HomeView(),
    Center(child: Text('Protection')),
    Center(child: Text('Bookmarks')),
    Center(child: Text('Account')),
    Center(child: Text('Settings')),
  ];

  Widget getWebScreen() {
    return webPages[selectedIndex.value];
  }
}
