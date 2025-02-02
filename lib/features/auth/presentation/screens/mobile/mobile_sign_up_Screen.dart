// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../getx/controllers/auth_controller.dart';

// class MobileSignUpScreen extends StatelessWidget {
//   const MobileSignUpScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.find<AuthController>();

//     return Scaffold(
//       appBar: AppBar(title: const Text("Signup")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               decoration: const InputDecoration(labelText: 'Name'),
//               onChanged: (value) => controller.name.value = value,
//             ),
//             TextField(
//               decoration: const InputDecoration(labelText: 'Email'),
//               onChanged: (value) => controller.email.value = value,
//             ),
//             TextField(
//               decoration: const InputDecoration(labelText: 'Password'),
//               obscureText: true,
//               onChanged: (value) => controller.password.value = value,
//             ),
//             const SizedBox(height: 20),
//             Obx(() => controller.isLoading.value
//                 ? const CircularProgressIndicator()
//                 : ElevatedButton(
//               onPressed: controller.signup,
//               child: const Text("Signup"),
//             )),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:next_pass/core/constants/app_assets.dart';
import 'package:next_pass/core/constants/app_colors.dart';
import 'package:next_pass/core/constants/app_dimensions.dart';
import 'package:next_pass/core/constants/app_strings.dart';
import 'package:next_pass/core/widgets/primary_button.dart';

class MobileSignUpScreen extends StatelessWidget {
  final TextEditingController username = TextEditingController();
  bool _isChecked = false;

  MobileSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Image.asset(
              AppImageAssets.appLogo,
              width: 80,
              height: 100,
            ),
            const SizedBox(height: 10),
            Text(
              AppStrings.creat_acc,
              style: TextStyle(
                  color: AppColors.backgroundLight,
                  fontSize: AppDimensions.fontLarge),
            ),
            const SizedBox(height: 10),
            TextFormField(
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontFamily: "Montserrat",
              ),
              decoration: InputDecoration(
                hintStyle: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                  fontFamily: "Montserrat",
                ),
                hintText: 'Enter your name',
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontFamily: "Montserrat",
              ),
              decoration: InputDecoration(
                hintStyle: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                  fontFamily: "Montserrat",
                ),
                hintText: 'Enter your email',
                prefixIcon: Icon(Icons.email),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontFamily: "Montserrat",
              ),
              decoration: InputDecoration(
                hintStyle: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                  fontFamily: "Montserrat",
                ),
                hintText: 'Create Password',
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontFamily: "Montserrat",
              ),
              decoration: InputDecoration(
                hintStyle: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                  fontFamily: "Montserrat",
                ),
                hintText: 'Confirm Password',
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Checkbox(
                  value: _isChecked,
                  onChanged: (bool? value) {},
                ),
                RichText(
                  text: TextSpan(
                    text: "I agree to the terms of service ",
                    style: TextStyle(color: Colors.white),
                    children: [
                      TextSpan(
                        text: "Privacy policy",
                        style: TextStyle(
                          color: Colors.blue, // You can change the color here
                          decoration: TextDecoration
                              .underline, // Optionally add underline
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
             const SizedBox(height: 20),
            PrimaryButton(text: "Sign Up", onPressed: () {}),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text("By Signing up, you agree to our Terms of service and Privacy Policy"),
            ),
            const SizedBox(height: 20),
            Text("Already Have an account? Sign In")
            
            
          ],
        ),
      ),
    );
  }
}
