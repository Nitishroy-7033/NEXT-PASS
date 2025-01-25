import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:next_pass/presentation/views/home/home_screen.dart';

// Import your screens here
import 'app_routes.dart';

class RouteGenerator {
  static List<GetPage> getRoutes() {
    return [
      GetPage(
        name: AppRoutes.home,
        page: () => HomeScreen(),
        transition: Transition.fadeIn,
      ),
      
    ];
  }
}