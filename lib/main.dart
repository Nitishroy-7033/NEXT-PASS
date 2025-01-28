import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:next_pass/core/constants/app_themes.dart';
import 'package:next_pass/features/splash/presentation/getx/bindings/splash_binding.dart';
import 'core/routes/app_routes.dart';
import 'core/routes/route_generator.dart';
import 'features/auth/presentation/getx/bindings/auth_binding.dart';


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
      initialRoute: AppRoutes.splash,
      getPages: RouteGenerator.getRoutes(),
      initialBinding: SplashBinding(),
      //   unknownRoute: GetPage(
      //   name: AppRoutes.notFound,
      //   // page: () => NotFoundScreen(),
      // )
      theme: AppThemes.lightTheme,
      // home:  const Scaffold(
      //   body: Center(
      //     child: Text("Hello World"),
      //   ),
      // ),
    );
  }
}
