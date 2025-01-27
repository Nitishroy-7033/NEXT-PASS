import 'package:get/get.dart';
import 'package:next_pass/features/auth/presentation/getx/bindings/auth_binding.dart';
import 'package:next_pass/features/auth/presentation/screens/mobile/mobile_login_screen.dart';
import 'package:next_pass/features/auth/presentation/views/login_view.dart';
import 'package:next_pass/features/auth/presentation/views/sign_up_view.dart';

// Import your screens here
import '../../features/auth/presentation/views/master_password_view.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/splace/presentation/views/splace_view.dart';
import 'app_routes.dart';

class RouteGenerator {
  static List<GetPage> getRoutes() {
    return [

      GetPage(
        name: AppRoutes.splash,
        page: () => const SplaceView(),
        transition: Transition.fadeIn,

      ),
      GetPage(
        name: AppRoutes.signUp,
        page: () => const SignUpView(),
        transition: Transition.fadeIn,

      ),
      GetPage(
        name: AppRoutes.login,
        page: () => const LoginView(),
        transition: Transition.fadeIn,

      ),  GetPage(
        name: AppRoutes.masterPassword,
        page: () => const MasterPasswordView(),
        transition: Transition.fadeIn,

      ),
      GetPage(
        name: AppRoutes.home,
        page: () => const HomeView(),
        transition: Transition.fadeIn,
      ),


    ];
  }
}