<<<<<<< HEAD


import '../../../../../core/constants/app_linker.dart';
=======
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:next_pass/core/constants/app_assets.dart';
import 'package:next_pass/core/constants/app_colors.dart';
import 'package:next_pass/features/auth/presentation/screens/mobile/mobile_login_screen.dart';
import 'package:next_pass/features/auth/presentation/screens/mobile/mobile_sign_up_Screen.dart';
>>>>>>> 531517e5c5e5260bcb6df169be745c296182cf84

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 80),
            Container(
              height: 92,
              width: 92,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: SvgPicture.asset(IconsAssets.personProfileIcon, color: Theme.of(context).colorScheme.onPrimaryContainer,)
            ),

            const SizedBox(height: 10),
             Text(
              "Login or Sign Up",
              style: Theme.of(context ).textTheme.bodyMedium,  
            ),
            const SizedBox(height: 10),
             Text(
              "We need some details to create your account\nand use our system.",
              textAlign: TextAlign.center,
              style: Theme.of(context ).textTheme.labelMedium,  
            ),

            const SizedBox(height: 30),
            // Toggle Buttons (Login / Signup)
            Container(
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
              child: Row(
                children: [
                  _buildToggleButton("LOGIN", 0),
                  _buildToggleButton("SIGNUP", 1),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Login / Signup Forms
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(20),
              ),
              child: selectedIndex == 0
                  ? const MobileLoginScreen()
                  : const MobileSignUpScreen(),
            ),

            const SizedBox(height: 40),

            // Signup Prompt
            Text.rich(
              TextSpan(
                text: "Don't have an account? ",
                style:const  TextStyle(fontSize: 13),
                children: [
                  TextSpan(
                    text: "Create Now",
                    style: TextStyle(
                      fontSize: 13,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Footer
            Text(
              "@NextPass",
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleButton(String title, int index) {
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedIndex = index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            color: selectedIndex == index
                ? Theme.of(context).colorScheme.primary
                : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(
              color: selectedIndex == index
                  ? Theme.of(context).colorScheme.onPrimaryContainer
                  : Theme.of(context).colorScheme.onSecondaryContainer,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
