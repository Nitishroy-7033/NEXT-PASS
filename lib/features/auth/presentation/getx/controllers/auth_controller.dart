import 'package:get/get.dart';

import '../../../domain/entities/user.dart';
import '../../../domain/usecases/user_login.dart';
import '../../../domain/usecases/user_signup.dart';


class AuthController extends GetxController {
  final LoginUseCase loginUseCase;
  final SignupUseCase signupUseCase;

  AuthController({
    required this.loginUseCase,
    required this.signupUseCase,
  });

  var email = ''.obs;
  var password = ''.obs;
  var name = ''.obs;
  var isLoading = false.obs;
  var user = Rxn<User>();

  Future<void> login() async {
    isLoading.value = true;
    try {
      final loggedInUser = await loginUseCase.execute(email.value, password.value);
      user.value = loggedInUser;
      Get.snackbar('Success', 'Welcome ${loggedInUser.name}');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signup() async {
    isLoading.value = true;
    try {
      final newUser = await signupUseCase.execute(name.value, email.value, password.value);
      user.value = newUser;
      Get.snackbar('Success', 'Welcome ${newUser.name}');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
