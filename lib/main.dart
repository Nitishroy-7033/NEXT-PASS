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
    return ScreenUtilInit(
        designSize: const Size(393, 852),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'NEXT PASS',
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
        });
  }
}



   // For Device Preview
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:device_preview/device_preview.dart';

// import 'package:next_pass/core/routes/route_generator.dart';
// import 'core/constants/app_linker.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   DependencyInjection.init();
  
//   runApp(
//     DevicePreview(
//       enabled: true, // Set to false when releasing the app
//       builder: (context) => const MyApp(), // Wrap MyApp with DevicePreview
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'NEXT PASS',
//       initialRoute: AppRoutes.splash,
//       getPages: RouteGenerator.getRoutes(),
//       initialBinding: SplashBinding(),
//       theme: AppThemes.lightTheme,
//       darkTheme: AppThemes.darkTheme,
//       themeMode: ThemeMode.dark,
//       unknownRoute: GetPage(
//         name: AppRoutes.notFound,
//         page: () => const NotFoundView(),
//       ),
//       builder: DevicePreview.appBuilder, // Add DevicePreview appBuilder
//       useInheritedMediaQuery: true, // Enable media query adaptation
//     );
//   }
// }
