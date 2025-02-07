import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:next_pass/core/constants/app_themes.dart';
import 'package:next_pass/features/not_found/presentation/views/not_found_view.dart';
import 'core/routes/app_routes.dart';
import 'core/routes/route_generator.dart';
import 'dependency_injection.dart';
import 'features/splash/presentation/getx/bindings/splash_binding.dart';

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
      //initialRoute: AppRoutes.dashboard,
      initialRoute: AppRoutes.splash,
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
