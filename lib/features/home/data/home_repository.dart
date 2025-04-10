import '../../../core/constants/app_linker.dart';

class HomeRepository {
  final ApiClient apiClient = Get.find<ApiClient>(); // ✅ Injected automatically

  Future<ApiResponse<List<HomeModel>>> getCredentials() async {
    try {
      var response = await apiClient.request(
        "/Credential", // ✅ Adjust endpoint as needed
        method: "GET",
      );
      print(
          "🔹 Full API Response Object: $response"); // ✅ Check if response exists
      print(
          "🔹 Raw API Response Data: ${response.data}"); // ✅ Check response.data

      List<HomeModel> credentials =
          (response.data["data"]["credentials"] as List)
              .map((json) => HomeModel.fromMap(json))
              .toList();

      return ApiResponse<List<HomeModel>>(
        data: credentials,
        message:
            response.data["message"] ?? "Credentials retrieved successfully",
        success: response.data["success"] ?? false,
      );
    } catch (e) {
      return ApiResponse<List<HomeModel>>(
        data: null,
        message: e.toString(),
        success: false,
      );
    }
  }
}