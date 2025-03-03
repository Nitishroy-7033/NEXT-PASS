import 'package:get/get.dart';
import 'package:get/get_navigation/src/snackbar/snackbar_controller.dart';

import '../constants/app_linker.dart';

SnackbarController SuccessMessage(message) {
  return Get.rawSnackbar(
      animationDuration: const Duration(seconds: 2),
      backgroundColor: Colors.green,
      icon: const Icon(Icons.done),
      margin: EdgeInsets.all(10),
      forwardAnimationCurve: Curves.ease,
      snackStyle: SnackStyle.FLOATING,
      message: message);
}
SnackbarController ErrorMessage(message) {
  return Get.rawSnackbar(
      animationDuration: const Duration(seconds: 2),
      backgroundColor: Colors.red,
      icon: const Icon(Icons.error),
      margin: EdgeInsets.all(10),
      forwardAnimationCurve: Curves.ease,
      snackStyle: SnackStyle.FLOATING,
      message: message);
}
SnackbarController WarningMessage(message) {
  return Get.rawSnackbar(
      animationDuration: const Duration(seconds: 2),
      backgroundColor: Colors.yellow,
      icon: const Icon(Icons.warning),
      margin: EdgeInsets.all(10),
      forwardAnimationCurve: Curves.ease,
      snackStyle: SnackStyle.FLOATING,
      message: message);
}
