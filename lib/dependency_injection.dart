import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'core/network/api_client.dart';

class DependencyInjection {
  static void init() {
    Get.lazyPut(() => http.Client());
    Get.lazyPut(() => ApiClient(baseUrl: "https://api.example.com")..init());
  }
}