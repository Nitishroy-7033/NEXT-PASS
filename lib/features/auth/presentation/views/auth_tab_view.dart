import '../../../../core/constants/app_linker.dart';

class AuthTabView extends StatelessWidget {
  const AuthTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Responsive(
        mobile: AuthScreen(), tablet: AuthScreen(), desktop: AuthScreen());
  }
}
