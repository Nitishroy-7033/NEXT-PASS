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
        ApiClient(baseUrl: "https://nextpassserverapi.onrender.com"),
        permanent: true);

    Get.lazyPut<AuthInterface>(() => AuthRepository());
    Get.lazyPut<AuthRepository>(() => AuthRepository());
    Get.lazyPut<AuthController>(() => AuthController());

    print("Dependency Injection completed."); // Debugging
  }
}
