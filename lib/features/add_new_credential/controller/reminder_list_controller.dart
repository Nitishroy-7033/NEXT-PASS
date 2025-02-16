import 'package:get/get.dart';

class ReminderListController extends GetxController {
  // do not change "selectedValue" variable name
  Rx<String> selectedValue = '30 Days'.obs;

// do not change "setDropdownValue" function name
  void setDropdownValue(String value) {
    selectedValue.value = value;
  }
}