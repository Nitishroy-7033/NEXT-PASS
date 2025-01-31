import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../getx/controllers/auth_controller.dart';


class MobileSignUpScreen extends StatelessWidget {
  const MobileSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());

    return Scaffold(
      appBar: AppBar(title: const Text("Signup")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(hintText: 'Name'),
              onChanged: (value) => controller.name.value = value,
            ),
            TextField(
              decoration: const InputDecoration(hintText: 'Email'),
              onChanged: (value) => controller.email.value = value,
            ),
            TextField(
              decoration: const InputDecoration(hintText: 'Password'),
              obscureText: true,
              onChanged: (value) => controller.password.value = value,
            ),
            const SizedBox(height: 20),
            Obx(() => controller.isLoading.value
                ? const CircularProgressIndicator()
                : ElevatedButton(
              onPressed: (){},
              child: const Text("Signup"),
            )),
          ],
        ),
      ),
    );
  }
}
