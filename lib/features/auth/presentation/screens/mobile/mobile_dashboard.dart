import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:next_pass/core/widgets/navbar.dart';
import 'package:next_pass/features/auth/presentation/getx/controllers/navbar_controller.dart';

class MobileDashboard extends StatelessWidget {
  const MobileDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final NavBarController navBarController = Get.put(NavBarController());
    return Scaffold(
      bottomNavigationBar: Navbar(),
      body: Obx(
          () => navBarController.pages[navBarController.selectedIndex.value]),
    );
  }
}
