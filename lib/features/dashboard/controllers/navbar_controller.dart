
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:next_pass/features/auth/presentation/views/auth_tab_view.dart';

import '../../home/presentation/views/home_view.dart';
class NavController extends GetxController {
  var selectedIndex = 0.obs;



  var pages = [
    const HomeView(),
    const AuthTabView(),
    const HomeView(),
    const HomeView(),
  ];

  void updateIndex(int index) {
    selectedIndex.value = index;
  }
 

}
