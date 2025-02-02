import 'package:get/get.dart';
import 'package:next_pass/core/network/api_client.dart';
import 'package:next_pass/features/add_new_credential/data/interface.dart';
import 'package:next_pass/features/add_new_credential/models/new_credenatial.dart';

class CredentialRepository implements CredentialInterface {

  final apiClient = Get.find<ApiClient>();
  @override
  Future<bool> createNewCredeantial(CredentialModel newCredenatil) async {
    try {
      await apiClient.post("newCredenatil", newCredenatil.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<List<CredentialModel>> getAllCredentail() async {
    final response = await apiClient.get("credenatial");
    return (response as List)
        .map((item) => CredentialModel.fromJson(item))
        .toList();
  }

  @override
  Future<List<CredentialModel>> searchCredential() {
    throw UnimplementedError();
  }

}