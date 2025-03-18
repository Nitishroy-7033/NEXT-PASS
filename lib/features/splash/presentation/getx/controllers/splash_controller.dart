import 'package:next_pass/features/auth/models/auth_model.dart';

import '../../../../../core/constants/app_linker.dart';

class SplashController extends GetxController {
  final ApiClient apiClient = Get.find<ApiClient>();

  @override
  void onInit() {
    super.onInit();
    _navigateToGetStarted();
  }

  Future<void> _navigateToGetStarted() async {
    AuthModel userDetails = await apiClient.getUserData();
    Timer(const Duration(seconds: 5), () {
      if (userDetails.token != null && userDetails.role != null) {
        Get.offAllNamed(AppRoutes.masterPassword);
      } else {
        Get.offAllNamed(AppRoutes.getStarted);
      }
    });
  }
}
