import 'package:next_pass/core/routes/route_generator.dart';

import 'core/constants/app_linker.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DependencyInjection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NEXT PASS',
      initialRoute: AppRoutes.newCredential,
      getPages: RouteGenerator.getRoutes(),
      initialBinding: SplashBinding(),
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.dark,
      unknownRoute: GetPage(
        name: AppRoutes.notFound,
        page: () => const NotFoundView(),
      ),
    );
  }
}
