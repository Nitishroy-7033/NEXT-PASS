import '../../../core/constants/app_linker.dart';

class CredentialRepository implements CredentialInterface {
  final ApiClient apiClient = Get.find<ApiClient>();


  @override
  Future deleteCredential(String credentialId) async {
    try {
      var response = await apiClient.request(
        "/credential/$credentialId",
        method: "DELETE",
      );

      if (response.statusCode == 200) {
        print("✅ Credential deleted successfully");
        return true;
      } else {
        throw Exception("Server error: ${response.statusCode}");
      }
    } catch (e) {
      print("⚠️ Error creating credential: $e");
      rethrow; // Propagate error to controller
    }
  }
}
