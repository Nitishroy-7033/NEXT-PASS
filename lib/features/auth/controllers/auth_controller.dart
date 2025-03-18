import 'package:next_pass/core/utils/messages.dart';
import 'package:next_pass/features/auth/data/auth_repository.dart';
import 'package:next_pass/features/auth/models/auth_model.dart';

import '../../../core/constants/app_linker.dart';

class AuthController extends GetxController {
  final AuthRepository authRepository = Get.put(AuthRepository()); 
  final ApiClient apiClient = Get.find<ApiClient>(); 
  final MasterPasswordController pinController = Get.put(MasterPasswordController());

  var isLoading = false.obs;
  var authModel = Rx<AuthModel?>(null);
  var isError = false.obs;
  var errorMessage = "".obs;


Future<void> login(String email, String password) async {
  isLoading.value = true;
  isError.value = false;
  errorMessage.value = "";

  try {
    final response = await authRepository.login(email, password);
    if (response.success == true && response.data != null) {
      authModel.value = response.data;
      apiClient.setUserDetails(response.data!);
      SuccessMessage(response.message ?? "Logged in successfully");

      // ✅ Master PIN check karo
      await pinController.loadSavedPin();

      // ✅ Sirf ek screen pe le jao, jo create/validate dono handle karega
      Get.offAllNamed(AppRoutes.masterPassword);
      
    } else {
      handleError(response.message);

  
  Future<void> login(String email, String password) async {
    isLoading.value = true;
    isError.value = false;
    errorMessage.value = "";
    try {
      final response = await authRepository.login(email, password);
      if (response.success == true && response.data != null) {
        authModel.value = response.data;
        apiClient.setUserDetails(response.data!);
        SuccessMessage(response.message ?? "Logged in successfully");
        Get.offAllNamed(AppRoutes.home);
      } else {
        handleError(response.message);
      }
    } catch (e) {
      print("Error ${e}");
      handleError(e);
    } finally {
      isLoading.value = false;

    }
  } catch (e) {
    print("Error: $e");
    handleError(e);
  } finally {
    isLoading.value = false;
  }
}


  Future<void> createAnAccount(
      String email, String password, String firstName, String lastName) async {
    isLoading.value = true;
    isError.value = false;
    errorMessage.value = "";
    try {
      final response = await authRepository.createAnAccount(
          email, password, firstName, lastName);
      
      if (response.success == true && response.data != null) {
        authModel.value = response.data;
        apiClient.setUserDetails(response.data!);
        SuccessMessage(response.message ?? "Account created successfully");
        Get.offAllNamed(AppRoutes.home);
      } else {
        handleError(response.message);
      }
    } catch (e) {
      print("Error ${e}");
      handleError(e);
    }
}

  void handleError(dynamic response) {
    isError.value = true;
    errorMessage.value = "ERROR come";
    print(response);
    ErrorMessage(errorMessage.value);
  }

  Future<void> logOut() async {
    await apiClient.removeAuthToken();
    Get.offAllNamed(AppRoutes.authtab);
  }
}
