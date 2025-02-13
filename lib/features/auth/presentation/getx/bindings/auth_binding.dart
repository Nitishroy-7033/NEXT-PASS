import 'package:http/http.dart' as http;
import '../../../../../core/constants/app_linker.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => http.Client());
    Get.lazyPut<AuthRepository>(() => AuthRepositoryImpl(Get.find()));
    Get.lazyPut(() => LoginUseCase(Get.find()));
    Get.lazyPut(() => SignupUseCase(Get.find()));
    Get.lazyPut(() => AuthController(
    ));
  }
}
