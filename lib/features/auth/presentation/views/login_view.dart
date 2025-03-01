import '../../../../core/constants/app_linker.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
        mobile:  MobileLoginScreen(),
        tablet: WebLoginScreen(),
        desktop: WebLoginScreen());
  }
}
