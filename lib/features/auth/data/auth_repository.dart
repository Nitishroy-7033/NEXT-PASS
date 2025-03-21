import 'package:next_pass/core/network/api_client.dart';
import 'package:next_pass/features/auth/data/auth_interface.dart';
import 'package:next_pass/features/auth/models/auth_model.dart';
import '../../../core/constants/api_response.dart';
import 'package:get/get.dart';

class AuthRepository implements AuthInterface {
  final ApiClient apiClient = Get.find<ApiClient>(); // ✅ Injected automatically

  @override
  Future<ApiResponse<AuthModel>> login(String email, String password) async {
    try {
      var response = await apiClient.request(
        "/Auth/login",
        method: "POST",
        data: {
          "email": email,
          "password": password,
        },
      );
      return ApiResponse<AuthModel>(
        data: AuthModel.fromJson(response.data["data"]),
        message: response.data["message"] ?? "Login successful",
        success: response.data["success"] ?? false,
      );
    } catch (e) {
      return ApiResponse<AuthModel>(
        data: null,
        message: e.toString(),
        success: false,
      );
    }
  }

  @override
  Future<ApiResponse<AuthModel>> createAnAccount(
      String email, String pwd, String firstName, String lastName) async {
    try {
      var response = await apiClient.request(
        "/Auth/register",
        method: "POST",
        data: {
          "email": email,
          "password": pwd,
          "firstName": firstName,
          "lastName": lastName
        });
    return ApiResponse<AuthModel>(
      data: AuthModel.fromJson(response.data["data"]),
      message: response.data["message"] ?? "Account created successfully",
      success: response.data["success"] ?? false,
    );
    } catch(e) {
       return ApiResponse<AuthModel>(
        data: null,
        message: e.toString(),
        success: false,
      );
    }
  } 
}
