import '../../../../core/constants/app_linker.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Responsive(
        mobile: MobileSignUpScreen(),
        tablet: WebSignUpScreen(),
        desktop: WebSignUpScreen());
  }
}
