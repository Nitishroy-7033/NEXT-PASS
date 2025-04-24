import '../../../core/constants/app_linker.dart';

class ReminderListController extends GetxController {
  Rx<String> selectedValue = '30 Days'.obs;

  void setDropdownValue(String value) {
    selectedValue.value = value;
  }

}
