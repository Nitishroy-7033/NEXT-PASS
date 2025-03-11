import 'package:get/get.dart';
import 'package:next_pass/core/network/api_client.dart';
import 'package:next_pass/features/add_new_credential/data/interface.dart';
import 'package:next_pass/features/add_new_credential/models/new_credenatial.dart';

class CredentialRepository implements CredentialInterface {
  final apiClient = Get.find<ApiClient>();

  Future<bool> createNewCredential(String siteUrl, String userName,
      String emailId, String mobileNumber, String password) async {
    try {
      var response = await apiClient.request(
        "/credential",
        method: "POST",
        data: {
          "siteUrl": siteUrl,
          "userName": userName,
          "emailId": emailId,
          "mobileNumber": mobileNumber,
          "password": password
        },
      );

      if (response.statusCode == 200) {
        print("✅ Credential created successfully: ${response.data}");
        return true;
      } else {
        print("❌ Failed to create credential: ${response.data}");
        return false;
      }
    } catch (e) {
      print("⚠️ Error creating credential: $e");
      return false;
    }
  }

  @override
  Future<List<CredentialModel>> searchCredential() {
    throw UnimplementedError();
  }

  @override
  Future<List<CredentialModel>> getAllCredentail() {
    throw UnimplementedError();
  }
}
