import '../../../core/constants/app_linker.dart';

class ProfileRepository {

final ApiClient apiClient = Get.find<ApiClient>();
final AuthController authController = Get.find<AuthController>();
  


  Future<ApiResponse<ProfileModel>> GetProfileInfo() async {
    try {
       // 🔥 Email ko async tarike se fetch karna
      String? getEmail = await authController.getEmailFromLocal();
      print("📩 Email fetched from local storage: $getEmail");
      if (getEmail == null || getEmail.isEmpty) {
        throw Exception("Email not found");
      }

      var encodedEmail = Uri.encodeComponent(getEmail);
      var response = await apiClient.request(
        "/User/$getEmail",
        method: "GET",
      
      );
      print("🚀 Full API response: ${response.data}");

      return ApiResponse<ProfileModel>(
        data: ProfileModel.fromJson(response.data["data"]),
        message: response.data["message"] ?? "Profile fetched successfully",
        success: response.data["success"] ?? false,
      );
    } catch (e) {
      var errorMap = e as Map<String, dynamic>;

      return ApiResponse<ProfileModel>(
        data: null,
        message: errorMap["message"] ?? "Something went wrong",
        success: errorMap["success"] ?? false,
      );
    }
  }

}


