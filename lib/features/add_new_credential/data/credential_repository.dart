import 'package:next_pass/core/constants/app_linker.dart';

class CredentialRepository implements CredentialInterface {
  final ApiClient apiClient = Get.find<ApiClient>();
  @override
  Future<bool> createNewCredential(
      String siteUrl,
      String userName,
      String emailId,
      String titleController,
      String mobileNumber,
      String password,
      int passwordChangeReminder) async {
    try {
      var response = await apiClient.request(
        "/credential",
        method: "POST",
        data: {
          "siteUrl": siteUrl,
          "userName": userName,
          "emailId": emailId,
          "Title": titleController,
          "mobileNumber": mobileNumber,
          "password": password,
          "passwordChangeReminder":passwordChangeReminder,
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
    // TODO: implement getAllCredentail
    throw UnimplementedError();
  }

// Nitish bro code
// Future<bool> createNewCredeantial(CredentialModel newCredenatil) async {
  //   try {
  //     // await apiClient.post("newCredenatil", newCredenatil.toJson());
  //     return true;
  //   } catch (e) {
  //     return false;
  //   }
  // }

  // @override
  // Future<List<CredentialModel>> getAllCredentail() async {
  //   final response = await apiClient.get("credenatial");
  //   return (response as List)
  //       .map((item) => CredentialModel.fromJson(item))
  //       .toList();
  // }
}
