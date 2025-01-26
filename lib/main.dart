import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      initialRoute: AppRoutes.splace,
      getPages: RouteGenerator.getRoutes(),
      initialBinding: AuthBinding(),
      //   unknownRoute: GetPage(
      //   name: AppRoutes.notFound,
      //   // page: () => NotFoundScreen(),
      // )
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,

      ),
      // home:  const Scaffold(
      //   body: Center(
      //     child: Text("Hello World"),
      //   ),
      // ),
    );
  }
}
