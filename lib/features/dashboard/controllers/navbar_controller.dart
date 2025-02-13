

import '../../../core/constants/app_linker.dart';

class NavController extends GetxController {
  var selectedIndex = 0.obs;



  var pages = [
    const HomeView(),
    const AuthTabView(),
    const HomeView(),
    const HomeView(),
  ];

  void updateIndex(int index) {
    selectedIndex.value = index;
  }
 

}
