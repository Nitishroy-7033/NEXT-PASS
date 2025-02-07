import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:next_pass/features/add_new_credential/data/credential_repository.dart';
import 'core/network/api_client.dart';
import 'features/add_new_credential/data/interface.dart';

class DependencyInjection {
  static void init() {
    Get.lazyPut(() => http.Client());
    Get.lazyPut(() => ApiClient(baseUrl: "https://next-pass-g6gfa2add9aeaafa.centralus-01.azurewebsites.net/")..init());
    Get.lazyPut(() => ApiClient(baseUrl: "https://api.example.com")..init());
    Get.lazyPut<CredentialInterface>(() => CredentialRepository());
  }
}
