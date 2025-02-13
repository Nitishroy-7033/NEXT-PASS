import '../../../../../core/constants/app_linker.dart';

class AuthController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;
  var name = ''.obs;
  var isLoading = false.obs;
  var user = Rxn<User>();
}
