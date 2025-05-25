import 'package:next_pass/core/constants/app_linker.dart';

class MobileProfilePage extends StatelessWidget {
  const MobileProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());
    final ProfileController profileController = Get.put(ProfileController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        scrolledUnderElevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        child: Column(
          children: [
            ProfileHeaderSection(profileController: profileController),
            SizedBox(height: 20.h),
            const AccountOptionsSection(),
            PreferenceOptionsSection(),
            SizedBox(height: 50.h),
            LogoutSection(authController: authController),
          ],
        ),
      ),
    );
  }
}
