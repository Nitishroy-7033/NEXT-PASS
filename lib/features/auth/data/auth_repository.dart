import '../../../core/constants/app_linker.dart';

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
      var errorMap = e as Map<String, dynamic>;

      return ApiResponse<AuthModel>(
        data: null,
        message: errorMap["message"] ?? "Something went wrong",
        success: errorMap["success"] ?? false,
      );
    }
  }

  @override
  Future<ApiResponse<AuthModel>> createAnAccount(
      String email, String pwd, String firstName, String lastName) async {
    try {
      var response = await apiClient.request("/Auth/register",
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
    } catch (e) {
      var errorMap = e as Map<String, dynamic>;

      return ApiResponse<AuthModel>(
        data: null,
        message: errorMap["message"] ?? "Something went wrong",
        success: errorMap["success"] ?? false,
      );
    }
  }
}
