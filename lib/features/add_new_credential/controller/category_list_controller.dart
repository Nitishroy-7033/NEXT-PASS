import 'package:get/get.dart';

class CategoryListController extends GetxController {
  // do not change "selectedValue" variable name
  Rx<String> selectedValue = 'Website'.obs;
  
// do not change "setDropdownValue" function name
  void setDropdownValue(String value) {
    selectedValue.value = value;
  }
}