import 'package:flutter/material.dart';
import 'package:next_pass/core/constants/app_strings.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/custom_text_button.dart';
import '../../../../../core/widgets/primary_button.dart';
class MobileMasterPasswordScreen extends StatelessWidget {
  const MobileMasterPasswordScreen({super.key});

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
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
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
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
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

                        // ),
                        const Spacer(
                          flex: 2,
                        ),
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
                    const SizedBox(height: 16),
                    const Text(
                      AppStrings.masterPasswordBiometrics,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 16, color: AppColors.labelDark),
                    ),
                    const SizedBox(height: 16),
                    IconButton(
                      icon: const Icon(
                        Icons.fingerprint,
                        size: 48,
                        color: AppColors.primaryLight,
                      ),
                      onPressed: () {
                        // Handle biometric unlock
                      },
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
