import 'package:get/get.dart';

class ReminderListController extends GetxController {
  Rx<String> selectedValue = '30 Days'.obs;

  void setDropdownValue(String value) {
    selectedValue.value = value;
  }
}
