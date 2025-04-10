import '../../../core/constants/app_linker.dart';

class GetStartedController extends GetxController {
  RxInt selectedView = 0.obs;

  List<Widget> viewList = const [
    MobileWelcomeScreen1(),
    MobileWelcomeScreen2(),
  ];
}
