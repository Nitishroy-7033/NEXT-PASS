// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../getx/controllers/auth_controller.dart';

// class MobileLoginScreen extends StatelessWidget {
//   const MobileLoginScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.find<AuthController>();

//     return Scaffold(
//       appBar: AppBar(title: const Text("Login")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
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
//               onPressed: controller.login,
//               child: const Text("Login"),
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


class MobileLoginScreen extends StatelessWidget {
  final TextEditingController username = TextEditingController();

  MobileLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            const SizedBox(height: 40),
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
            const SizedBox(height: 60),
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
                hintText: 'Email Address',
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 20),
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
                hintText: 'Password',
                prefixIcon: Icon(Icons.email),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 280,top: 20),
              child: Text("Forget Password"),
            ),
             const SizedBox(height: 40),
            PrimaryButton(text: "Login", onPressed: () {}),
            const SizedBox(height: 20),

            Text("Dont Have an account? Sign Up"),
            
            

            Obx(() => controller.isLoading.value
                ? const CircularProgressIndicator()
                : ElevatedButton(
              onPressed: (){},
              child: const Text("Login"),
            )),
          ],
        ),
      ),
    );
  }
}