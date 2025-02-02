import 'package:get/get.dart';
import 'package:next_pass/core/widgets/all_widgets_screen.dart';
<<<<<<< HEAD
import 'package:next_pass/features/auth/presentation/screens/mobile/mobile_dashboard.dart';
=======
import 'package:next_pass/features/add_new_credential/presentation/views/view_add_new_credential.dart';
import 'package:next_pass/features/auth/presentation/getx/bindings/auth_binding.dart';
import 'package:next_pass/features/auth/presentation/screens/mobile/mobile_login_screen.dart';
>>>>>>> 84484c8a760d7f85f96bb47ff8e67f1960b6fb01
import 'package:next_pass/features/auth/presentation/views/login_view.dart';
import 'package:next_pass/features/auth/presentation/views/sign_up_view.dart';
import 'package:next_pass/features/getStarted/presentations/view/get_started_view.dart';
import 'package:next_pass/features/not_found/presentation/views/not_found_view.dart';

// Import your screens here
import '../../features/auth/presentation/views/master_password_view.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/splash/presentation/views/splace_view.dart';
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
        name: AppRoutes.getStarted,
        page: () => const GetStartedView(),
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
      ),
      GetPage(
        name: AppRoutes.masterPassword,
        page: () => const MasterPasswordView(),
        transition: Transition.fadeIn,
      ),
      GetPage(
        name: AppRoutes.home,
        page: () => const HomeView(),
        transition: Transition.fadeIn,
      ),
      GetPage(
        name: AppRoutes.notFound,
        page: () => const NotFoundView(),
        transition: Transition.fadeIn,
      ),
      GetPage(
        name: AppRoutes.dashboard,
        page: () => const MobileDashboard(),
        transition: Transition.fadeIn,
      ),
      GetPage(
        name: AppRoutes.allWidgetsScreen,
        page: () => const AllWidgetsScreen(),
        transition: Transition.fadeIn,
      ),
<<<<<<< HEAD
=======
        GetPage(
        name: AppRoutes.newCredential,
        page: () => const ViewAddNewCredential(),
        transition: Transition.fadeIn,
      ),

>>>>>>> 84484c8a760d7f85f96bb47ff8e67f1960b6fb01
    ];
  }
}
