import 'package:next_pass/core/constants/app_linker.dart';

class ReminderListController extends GetxController {
  // do not change "selectedValue" variable name
  Rx<String> selectedValue = '30 Days'.obs;

// do not change "setDropdownValue" function name
  void setDropdownValue(String value) {
    selectedValue.value = value;
    print(selectedValue.value);
  }

  int getReminderValue() {
    if (selectedValue.value == '7 Days') {
      return 7;
    } else if (selectedValue.value == '15 Days') {
      return 15;
    } else if (selectedValue.value == '60 Days') {
      return 60;
    } else if (selectedValue.value == '90 Days') {
      return 90;
    } else {
      return 30;
    }
  }
}
