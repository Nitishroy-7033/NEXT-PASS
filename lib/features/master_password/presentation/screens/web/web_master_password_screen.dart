// // import 'package:flutter/cupertino.dart';
// //
// // class WebMasterPasswordScreen extends StatelessWidget {
// //   const WebMasterPasswordScreen({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return const Placeholder();
// //   }
// // }
//
// import 'package:flutter/material.dart';
//
// class WebMasterPasswordScreen extends StatelessWidget {
//   const WebMasterPasswordScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: const Text(
//           'NextPass',
//           style: TextStyle(
//             color: Colors.blue,
//             fontWeight: FontWeight.bold,
//             fontSize: 20,
//           ),
//         ),
//         elevation: 0,
//         backgroundColor: Colors.white,
//         actions: const [
//           Padding(
//             padding: EdgeInsets.all(8.0),
//             child: CircleAvatar(
//               backgroundImage: NetworkImage(
//                 'https://via.placeholder.com/150', // Replace with actual profile image URL
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(
//             horizontal: 100, vertical: 20), // Adjusted padding for web
//         child: Center(
//           child: SingleChildScrollView(
//             child: Card(
//               elevation: 4,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(24.0),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     const Text(
//                       'Enter Master Password',
//                       style: TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                     const SizedBox(height: 16),
//                     const Text(
//                       'Master Password',
//                       style:
//                           TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//                     ),
//                     const SizedBox(height: 8),
//                     TextFormField(
//                       obscureText: true,
//                       decoration: InputDecoration(
//                         hintText: 'Enter your master password',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         suffixIcon: const Icon(Icons.visibility_off),
//                       ),
//                     ),
//                     const SizedBox(height: 8),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Row(
//                           children: [
//                             Checkbox(
//                               value: false,
//                               onChanged: (value) {},
//                             ),
//                             const Text('Remember me'),
//                           ],
//                         ),
//                         TextButton(
//                           onPressed: () {},
//                           child: const Text('Forgot password?'),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 16),
//                     ElevatedButton(
//                       onPressed: () {},
//                       style: ElevatedButton.styleFrom(
//                         padding: const EdgeInsets.symmetric(vertical: 16),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         backgroundColor: Colors.blue,
//                       ),
//                       child: const Text(
//                         'Unlock',
//                         style: TextStyle(fontSize: 16),
//                       ),
//                     ),
//                     const SizedBox(height: 16),
//                     const Text(
//                       'Or unlock with biometrics',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(fontSize: 16, color: Colors.grey),
//                     ),
//                     const SizedBox(height: 16),
//                     IconButton(
//                       icon: const Icon(
//                         Icons.fingerprint,
//                         size: 48,
//                         color: Colors.blue,
//                       ),
//                       onPressed: () {
//                         // Handle biometric unlock
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:next_pass/core/constants/app_strings.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/custom_text_button.dart';
import '../../../../../core/widgets/primary_button.dart';

class WebMasterPasswordScreen extends StatelessWidget {
  const WebMasterPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryContainerLight,
      appBar: AppBar(
        title: const Text(
          AppStrings.appName,
          style: TextStyle(
            color: AppColors.primaryLight,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        elevation: 0,
        backgroundColor: AppColors.primaryContainerLight,
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage(AppImageAssets.demoProfileImage),
            ),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500), // Centered for Web
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      AppStrings.masterPasswordSubtitle,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      AppStrings.masterPasswordTitle,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: AppStrings.masterPasswordSubtitle,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        suffixIcon: const Icon(Icons.visibility_off),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: false,
                              onChanged: (value) {},
                            ),
                            const Text(
                              AppStrings.masterPasswordRemember,
                            ),
                          ],
                        ),
                        const Spacer(),
                        CustomTextButton(
                          text: AppStrings.masterPasswordForgot,
                          onPressed: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    PrimaryButton(
                      onPressed: () {},
                      text: ("Unlock"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
