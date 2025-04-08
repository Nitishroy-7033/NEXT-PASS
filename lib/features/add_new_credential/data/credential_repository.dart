import 'package:get/get.dart';
import 'package:next_pass/core/constants/app_linker.dart';

class CredentialRepository implements CredentialInterface {
  final ApiClient apiClient = Get.find<ApiClient>();

  @override
  Future<bool> createNewCredential(
    String siteUrl,
    String userName,
    String emailId,
    String title,
    String mobileNumber,
    String password,
    String categoryCred,
    String passwordChangeReminder,
  ) async {
    try {
      var response = await apiClient.request(
        "/credential",
        method: "POST",
        data: {
          "siteUrl": siteUrl,
          "userName": userName,
          "emailId": emailId,
          "Title": title, // Match casing with backend
          "PhoneNumber": mobileNumber,
          "password": password,
          "PasswordChangeReminder": passwordChangeReminder,
          "Category": categoryCred,
        },
      );

      if (response.statusCode == 200) {
        print("✅ Credential created successfully: ${response.data}");
        return true;
      } else {
        throw Exception("Server error: ${response.statusCode}");
      }
    } catch (e) {
      print("⚠️ Error creating credential: $e");
      rethrow; // Propagate error to controller
    }
  }

  @override
  Future<List<CredentialModel>> getAllCredentail() {
    throw UnimplementedError();
  }

  @override
  Future<List<CredentialModel>> searchCredential() {
    throw UnimplementedError();
  }
}
