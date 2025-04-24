import '../../../../core/constants/app_linker.dart';

class MobileNotFoundScreen extends StatelessWidget {
  const MobileNotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        'Page Not Found 😑',
        style: Theme.of(context).textTheme.headlineLarge,
      )),
    );
  }
}
