import 'package:next_pass/core/constants/app_linker.dart';
import 'package:next_pass/features/profile/presentation/views/view_profile_page.dart' show ViewProfilePage;
import 'package:next_pass/features/profile/presentation/widgets/Account/password_and_security.dart';
import 'package:next_pass/features/profile/presentation/widgets/Account/sub_screens/change_password_screen.dart';
import 'package:next_pass/features/profile/presentation/widgets/Account/personal_info.dart';
import 'package:next_pass/features/profile/presentation/widgets/Account/privacy.dart';

import '../../features/database setup/presentation/views/database_setup_view.dart';

class RouteGenerator {
  static List<GetPage> getRoutes() {
    return [
      GetPage(
        name: AppRoutes.splash,
        page: () => const SplaceView(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: AppRoutes.getStarted,
        page: () => const GetStartedView(),
        transition: Transition.downToUp,
        transitionDuration: const Duration(milliseconds: 600),
      ),
      GetPage(
        name: AppRoutes.authtab,
        page: () => const AuthTabView(),
        transition: Transition.rightToLeftWithFade,
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: AppRoutes.masterPassword,
        page: () => const MasterPasswordView(),
        transition: Transition.zoom,
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: AppRoutes.home,
        page: () => const HomeView(),
        transition: Transition.circularReveal,
        transitionDuration: const Duration(milliseconds: 600),
      ),
      GetPage(
        name: AppRoutes.notFound,
        page: () => const NotFoundView(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: AppRoutes.dashboard,
        page: () => const DashboardView(),
        transition: Transition.size,
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: AppRoutes.allWidgetsScreen,
        page: () => const AllWidgetsScreen(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: AppRoutes.newCredential,
        page: () => const ViewAddNewCredential(),
        transition: Transition.downToUp,
        transitionDuration: const Duration(milliseconds: 600),
      ),
      GetPage(
        name: AppRoutes.appCredentials,
        page: () => const AppCredentials(),
        transition: Transition.cupertino,
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: AppRoutes.searchCredential,
        page: () => const SearchCredentialView(),
        transition: Transition.rightToLeftWithFade,
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: AppRoutes.databaseSetup,
        page: () => const DatabaseSetupView(),
        transition: Transition.zoom,
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: AppRoutes.profilePage,
        page: () => const ViewProfilePage(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: AppRoutes.passwordAndSecurity,
        page: () => const PasswordAndSecurity(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: AppRoutes.changePassword,
        page: () => const ChangePasswordScreen(),
        transition: Transition.rightToLeftWithFade,
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: AppRoutes.personalInfo,
        page: () =>  PersonalInfoPage(),
        transition: Transition.circularReveal,
        transitionDuration: const Duration(milliseconds: 600),
      ),
      GetPage(
        name: AppRoutes.privacyInfo,
        page: () => const  PrivacyPolicyPage(),
        transition: Transition.circularReveal,
        transitionDuration: const Duration(milliseconds: 600),
      ),
    ];
  }
}