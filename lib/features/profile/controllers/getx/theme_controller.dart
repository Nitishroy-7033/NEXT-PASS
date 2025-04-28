import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
 
  var isLightTheme = true.obs;

  @override
  void onInit() {
    super.onInit();
    final brightness = WidgetsBinding.instance.platformDispatcher.platformBrightness;
    isLightTheme.value = brightness == Brightness.light;
    Get.changeThemeMode(isLightTheme.value ? ThemeMode.light : ThemeMode.dark);
  }

  ThemeMode get theme => isLightTheme.value ? ThemeMode.light : ThemeMode.dark;

  void toggleTheme(bool isOn) {
    isLightTheme.value = isOn;
    Get.changeThemeMode(isLightTheme.value ? ThemeMode.light : ThemeMode.dark);
  }
}
