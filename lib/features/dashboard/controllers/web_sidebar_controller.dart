
import '../../../core/constants/app_linker.dart';

class WebSidebarController extends GetxController {
  RxInt selectedIndex = 0.obs;

  void setIndex(int value) {
    selectedIndex.value = value;
  }

  final List<Widget> webPages = const [
    HomeView(),
    Center(child: Text('Protection')),
    Center(child: Text('Bookmarks')),
    Center(child: Text('Account')),
    Center(child: Text('Settings')),
  ];

  Widget getWebScreen() {
    return webPages[selectedIndex.value];
  }
}
