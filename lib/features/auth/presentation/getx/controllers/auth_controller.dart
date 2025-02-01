import 'package:get/get.dart';

import '../../../domain/entities/user.dart';

class AuthController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;
  var name = ''.obs;
  var isLoading = false.obs;
  var user = Rxn<User>();
}
