// import 'package:next_pass/core/constants/app_linker.dart';
// import 'package:get/get.dart';
// import 'package:next_pass/core/widgets/all_widgets_screen.dart';
// import 'package:next_pass/features/add_new_credential/presentation/views/view_add_new_credential.dart';

// import 'package:next_pass/features/auth/presentation/views/auth_tab_view.dart';
// import 'package:next_pass/features/auth/presentation/views/login_view.dart';
// import 'package:next_pass/features/auth/presentation/views/sign_up_view.dart';
// import 'package:next_pass/features/dashboard/presentation/views/dashboard_view.dart';
// import 'package:next_pass/features/getStarted/presentations/view/get_started_view.dart';
// import 'package:next_pass/features/not_found/presentation/views/not_found_view.dart';
// import 'package:next_pass/features/search_credential/views/search_credential_view.dart';

// // Import your screens here

// import '../../features/home/presentation/views/home_view.dart';
// import '../../features/master_password/presentation/views/master_password_view.dart';
// import '../../features/splash/presentation/views/splace_view.dart';
// import 'app_routes.dart';
import '../../../../core/constants/app_linker.dart';

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
        name: AppRoutes.authtab,
        page: () => const AuthTabView(),
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
        page: () => const DashboardView(),
        transition: Transition.leftToRightWithFade,
      ),
      GetPage(
        name: AppRoutes.allWidgetsScreen,
        page: () => const AllWidgetsScreen(),
        transition: Transition.fadeIn,
      ),
      GetPage(
        name: AppRoutes.newCredential,
        page: () => const ViewAddNewCredential(),
        transition: Transition.fadeIn,
      ),
       GetPage(
        name: AppRoutes.appCredentials,
        page: () => const AppCredentials(),
        transition: Transition.fadeIn,
      ),
      GetPage(
        name: AppRoutes.searchCredential,
        page: () => const SearchCredentialView(),
        transition: Transition.fadeIn)
    ];
  }
}
