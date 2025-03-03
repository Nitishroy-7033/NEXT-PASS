import 'package:next_pass/core/constants/app_linker.dart';

class PasswordController extends GetxController {
  var useUpperCase = false.obs;
  var useNumbers = false.obs;
  var useLowerCase = false.obs;
  var useSymbol = false.obs;

  var sliderValue = 7.0.obs;
}
