import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  RxBool isMoreTabOpen = false.obs;

  void runMoreTab() {
    isMoreTabOpen.value = !isMoreTabOpen.value;
  }
}
