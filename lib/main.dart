import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:next_pass/core/constants/app_themes.dart';
import 'package:next_pass/features/splash/presentation/getx/bindings/splash_binding.dart';
import 'core/routes/app_routes.dart';
import 'core/routes/route_generator.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NEXT PASS',
      initialRoute: AppRoutes.home,
      getPages: RouteGenerator.getRoutes(),
      initialBinding: SplashBinding(),
      //   unknownRoute: GetPage(
      //   name: AppRoutes.notFound,
      //   // page: () => NotFoundScreen(),
      // )
      theme: AppThemes.lightTheme,
    );
  }
}
