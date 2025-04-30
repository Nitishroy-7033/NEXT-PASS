import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  var isLightTheme = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadTheme(); 
  }

  void loadTheme() async {
    final sp = await SharedPreferences.getInstance();
    final savedTheme = sp.getBool('isLightTheme');

    if (savedTheme != null) {
      isLightTheme.value = savedTheme;
    } else {
      final brightness =
          WidgetsBinding.instance.platformDispatcher.platformBrightness;
      isLightTheme.value = brightness == Brightness.light;
    }

    Get.changeThemeMode(isLightTheme.value ? ThemeMode.light : ThemeMode.dark);
  }

  void toggleTheme(bool isLight) async {
    isLightTheme.value = isLight;
    final sp = await SharedPreferences.getInstance();
    await sp.setBool('isLightTheme', isLight);
    Get.changeThemeMode(isLight ? ThemeMode.light : ThemeMode.dark);
  }
}
