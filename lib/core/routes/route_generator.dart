import 'package:get/get.dart';
import 'package:next_pass/features/auth/presentation/getx/bindings/auth_binding.dart';
import 'package:next_pass/features/auth/presentation/screens/login_screen.dart';

// Import your screens here
import '../../features/home/presentation/screens/home_view.dart';
import 'app_routes.dart';

class RouteGenerator {
  static List<GetPage> getRoutes() {
    return [
      GetPage(
        name: AppRoutes.home,
        page: () => const HomeView(),
        transition: Transition.fadeIn,
      ),
      GetPage(
        name: AppRoutes.login,
        page: () => const LoginScreen(),
        transition: Transition.fadeIn,
        binding: AuthBinding(),
      ),
    ];
  }
}