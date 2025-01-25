import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:next_pass/presentation/routes/app_routes.dart';
import 'package:next_pass/presentation/routes/route_generator.dart';
import 'package:next_pass/presentation/views/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      initialRoute: AppRoutes.home, // Set the initial route
      getPages: RouteGenerator.getRoutes(),
      // unknownRoute: GetPage(
      //   name: AppRoutes.notFound,
      //   // page: () => NotFoundScreen(),
      // ),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}

