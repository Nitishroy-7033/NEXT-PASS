import 'package:get/get.dart';
import 'package:next_pass/core/routes/app_routes.dart';
import 'package:next_pass/core/utils/messages.dart';
import 'package:next_pass/features/auth/data/auth_repository.dart';
import 'package:next_pass/features/auth/models/auth_model.dart';
import 'package:next_pass/core/network/api_client.dart';

class AuthController extends GetxController {
  final AuthRepository authRepository = Get.put(AuthRepository()); // ✅ Injected
  final ApiClient apiClient = Get.find<ApiClient>(); // ✅ Injected

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
        // Get.offAllNamed(AppRoutes.home);
        Get.offAllNamed(AppRoutes.databaseSetup);
      } else {
        _handleError(response.message);
      }
    } catch (e) {
      print("Error ${e}");
      _handleError(e);
    } finally {
      isLoading.value = false;
    }
  }

  // Future<void> createAnAccount(
  //     String email, String pwd, String firstName, String lastName) async {
  //   var response =
  //       authRepository.createAnAccount(email, pwd, firstName, lastName);

  //   print(response);
  // }

  //signup method
  Future<void> createAnAccount(
      String email, String pwd, String firstName, String lastName) async {
    isLoading.value = true;
    isError.value = false;
    errorMessage.value = "";

    try {
      final response =
          await authRepository.createAnAccount(email, pwd, firstName, lastName);

      if (response.success == true && response.data != null) {
        SuccessMessage("Account created successfully");
        // Get.offAllNamed(AppRoutes.databaseSetup);
      } else {
        // Show a clean message instead of full JSON response
        if (response.message != null &&
            response.message!.contains("User with this email already exists")) {
          errorMessage.value = "Account is Existed";
        } else {
          errorMessage.value = "Something went wrong";
        }
        ErrorMessage(errorMessage.value);
      }
    } catch (e) {
      errorMessage.value = "An error occurred";
      ErrorMessage(errorMessage.value);
    } finally {
      isLoading.value = false;
    }
  }

  void _handleError(dynamic response) {
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
