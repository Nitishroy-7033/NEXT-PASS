import '../../../core/constants/app_linker.dart';

class CategoryListController extends GetxController {
  Rx<String> selectedValue = 'Website'.obs;

  void setDropdownValue(String value) {
    selectedValue.value = value;
  }
}
