import 'package:next_pass/core/constants/app_linker.dart';
import 'package:next_pass/features/add_new_credential/models/new_credenatial.dart';

class CredentialRepository implements CredentialInterface {
  final ApiClient apiClient = Get.find<ApiClient>();

  @override
  Future<List<CredentialModel>> getAllCredentials() async {
    try {
      final response = await apiClient.request("/Credential", method: "GET");

      if (response.data["success"] == true) {
        List<dynamic> credentialsData = response.data["data"]["credentials"];
        return credentialsData
            .map((json) => CredentialModel.fromJson(json))
            .toList();
      } else {
        throw Exception(
            response.data["message"] ?? "Failed to fetch credentials");
      }
    } catch (error) {
      throw Exception("Error fetching credentials: $error");
    }
  }
}
