import 'package:next_pass/core/constants/app_linker.dart';


class LogoutSection extends StatelessWidget {
  final AuthController authController;
  const LogoutSection({required this.authController, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.logout),
      title: Text('Logout', style: Theme.of(context).textTheme.bodyMedium),
      onTap: () {
        authController.logOut();
        Get.offAllNamed(AppRoutes.authtab);
      },
    );
  }
}
