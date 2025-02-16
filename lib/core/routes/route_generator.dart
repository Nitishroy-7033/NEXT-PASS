import 'package:next_pass/core/constants/app_linker.dart';

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
    ];
  }
}
