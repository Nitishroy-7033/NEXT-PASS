import 'package:next_pass/core/constants/app_linker.dart';

class DependencyInjection {
  static void init() {
    print("Initializing dependencies..."); // Debugging
    Get.lazyPut<NetworkService>(() => NetworkService());

    // Debug log
    print("Registering ApiClient...");
    Get.put<ApiClient>(
        ApiClient(baseUrl: "https://next-pass-server-api.onrender.com"),
        permanent: true);

    Get.lazyPut<AuthInterface>(() => AuthRepository());
    Get.lazyPut<AuthRepository>(() => AuthRepository());
    Get.lazyPut<AuthController>(() => AuthController());
    
    Get.lazyPut<DatabaseSetupInterface>(() => DatabaseSetupRepository());
    Get.lazyPut<DatabaseSetupRepository>(() => DatabaseSetupRepository());
    Get.lazyPut<SelectDatabaseController>(() => SelectDatabaseController());

    print("Dependency Injection completed."); // Debugging
  }
}
