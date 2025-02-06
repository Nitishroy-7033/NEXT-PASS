import 'package:get/get.dart';

class WebSidebarController extends GetxController {
 RxInt selectedIndex = 0.obs;

  void setIndex(int value) {
    selectedIndex.value = value;
  }
}
