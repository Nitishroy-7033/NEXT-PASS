import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:next_pass/core/constants/app_themes.dart';
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
      initialRoute: AppRoutes.home, // INITIAL ROUTE CHANGE KARNA HAI
      getPages: RouteGenerator.getRoutes(),
      initialBinding: AuthBinding(),
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
