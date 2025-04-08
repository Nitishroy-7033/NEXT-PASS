import 'package:next_pass/core/constants/api_response.dart';
import 'package:next_pass/features/auth/models/auth_model.dart';
import 'package:next_pass/features/database%20setup/data/database_setup_interface.dart';

import '../../../core/constants/app_linker.dart';

class DatabaseSetupRepository implements DatabaseSetupInterface {
  final ApiClient apiClient = Get.find<ApiClient>();

  @override
  Future<ApiResponse<AuthModel>> selectNextPassDB(String dataBaseType) async {
    try {
      var response = await apiClient.request(
        "/User/database-settings",
        method: "PUT",
        data: {
          "databaseString": null,
          "dataBaseType": dataBaseType,
        },
      );
       if (response.data["success"] == true) {
        await _saveDatabaseType(dataBaseType); // Save database type
      }

      return ApiResponse<AuthModel>(
        data: AuthModel.fromJson(response.data["data"]),
        message: response.data["message"] ?? "Database Selected Successfully",
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
  Future<ApiResponse<AuthModel>> selectUserDB(
      String dataBaseURL, String dataBaseType) async {
    try {
      var response = await apiClient.request(
        "/User/database-settings",
        method: "PUT",
        data: {
          "databaseString": dataBaseURL,
          "dataBaseType": dataBaseType,
        },
      );
      if (response.data["success"] == true) {
        await _saveDatabaseType(dataBaseType); // Save database type
      }
      return ApiResponse<AuthModel>(
        data: AuthModel.fromJson(response.data["data"]),
        message: response.data["message"] ?? "Database Selected Successfully",
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

 // Method to save database type in SharedPreferences
  Future<void> _saveDatabaseType(String databaseType) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("databaseType", databaseType);
  }
  Future<bool> isMasterPinSet() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.containsKey("saved_pin"); // Agar PIN set hai to true return karega

  
}








}
