import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../data/repository/auth_repository_impl.dart';
import '../../../domain/repository/auth_repository.dart';
import '../../../domain/usecases/user_login.dart';
import '../../../domain/usecases/user_signup.dart';
import '../controllers/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => http.Client());
    Get.lazyPut<AuthRepository>(() => AuthRepositoryImpl(Get.find()));
    Get.lazyPut(() => LoginUseCase(Get.find()));
    Get.lazyPut(() => SignupUseCase(Get.find()));
    Get.lazyPut(() => AuthController(
      loginUseCase: Get.find(),
      signupUseCase: Get.find(),
    ));
  }
}
