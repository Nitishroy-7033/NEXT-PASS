import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:next_pass/core/network/api_client.dart';
import 'package:next_pass/core/network/network_service.dart';
import 'package:next_pass/features/auth/controllers/auth_controller.dart';
import 'package:next_pass/features/auth/data/auth_repository.dart';
import 'package:next_pass/features/auth/data/auth_interface.dart';

class DependencyInjection {
  static void init() {
    // Register Http Client
    Get.lazyPut<http.Client>(() => http.Client());

    // Register Network Service
    Get.lazyPut<NetworkService>(() => NetworkService());

    // Register API Client globally, so no need to pass baseUrl manually
    Get.lazyPut<ApiClient>(() => ApiClient(baseUrl: "https://nextpassserverapi.onrender.com"));

    // Register Auth Repository with Interface
    Get.lazyPut<AuthInterface>(() => AuthRepository());
    Get.lazyPut<AuthRepository>(() => AuthRepository());

    // Register Auth Controller
    Get.lazyPut<AuthController>(() => AuthController());
  }
}
