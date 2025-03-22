import 'package:next_pass/features/database%20setup/data/database_setup_interface.dart';
import 'package:next_pass/features/database%20setup/data/database_setup_repository.dart';

import 'core/constants/app_linker.dart';
import 'core/network/network_service.dart';
import 'features/auth/controllers/auth_controller.dart';
import 'features/auth/data/auth_interface.dart';
import 'features/auth/data/auth_repository.dart';

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
