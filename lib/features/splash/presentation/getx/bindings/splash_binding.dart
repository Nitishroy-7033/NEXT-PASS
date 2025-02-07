import 'package:get/get.dart';
import 'package:next_pass/features/splash/presentation/getx/controllers/splash_controller.dart';
//import 'package:next_pass/features/splash/presentation/screens/mobile_splace_screen.dart';


class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
  }
}