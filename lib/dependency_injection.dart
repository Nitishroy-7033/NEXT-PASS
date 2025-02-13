import 'package:http/http.dart' as http;


import 'core/constants/app_linker.dart';

class DependencyInjection {
  static void init() {
    Get.lazyPut(() => http.Client());
    Get.lazyPut(() => ApiClient(
        baseUrl:
            "https://next-pass-g6gfa2add9aeaafa.centralus-01.azurewebsites.net/")
      ..init());
    Get.lazyPut<CredentialInterface>(() => CredentialRepository());
  }
}
