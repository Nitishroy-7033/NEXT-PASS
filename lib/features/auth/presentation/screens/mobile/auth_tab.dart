import 'package:flutter/material.dart';
import 'package:next_pass/core/constants/app_colors.dart';
import 'package:next_pass/features/auth/presentation/screens/mobile/mobile_login_screen.dart';
import 'package:next_pass/features/auth/presentation/screens/mobile/mobile_sign_up_Screen.dart';

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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              SizedBox(height: 80),
              Container(
                height: 92,
                width: 92,
                decoration: BoxDecoration(
                    color: AppColors.primaryDark,
                    borderRadius: BorderRadius.circular(20)),
                child: Icon(
                  Icons.person_2_outlined,
                  size: 50,
                  color: AppColors.fontDark,
                ),
              ),
              SizedBox(height: 30),
              Text(
                "Login or Sign Up",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 25),
              Text(
                "We need some details to create you account\nand use our system.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              SizedBox(height: 30),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  // color: AppColors.primaryContainerDark
                  color: Theme.of(context).colorScheme.primaryContainer
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = 0;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: selectedIndex == 0
                                ? AppColors.primaryDark
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'LOGIN',
                            style: TextStyle(
                               color:
                                   selectedIndex == 1 ? Colors.black : AppColors.backgroundLight, 
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = 1;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: selectedIndex == 1
                                ? AppColors.primaryDark
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'SIGNUP',
                            style: TextStyle(
                               color:
                                   selectedIndex == 0 ? Colors.black :AppColors.backgroundLight,
                              fontWeight: FontWeight.bold,
=======
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Image.asset(
              AppImageAssets.appLogo,
              height: 100,
            ),
            const SizedBox(height: 30),
            const Text(
              "Login or Sign Up Today",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 25),
            const Text(
              "Discover new connections and meaningful relationships with our dating app",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey[300],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = 0;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: selectedIndex == 0
                                    ? Colors.white
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  color: selectedIndex == 0
                                      ? Colors.black
                                      : Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = 1;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: selectedIndex == 1
                                    ? Colors.white
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                'SignUp',
                                style: TextStyle(
                                  color: selectedIndex == 1
                                      ? Colors.black
                                      : Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 370,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: selectedIndex == 0
                    ? MobileLoginScreen()
                    : MobileSignUpScreen(),
              ),
              SizedBox(
                height: 40,
              ),
              Text.rich(
                TextSpan(
                  text: 'Don’t have an Account? ',
                  style: TextStyle(
                    fontSize: 13,
                  ),
                  children: [
                    TextSpan(
                      text: 'Create Now',
                      style: TextStyle(fontSize: 13,color: AppColors.primaryDark),
                    ),
                  ],
                ),
                  const SizedBox(height: 20),
                  selectedIndex == 0
                      ? const MobileLoginScreen()
                      : const MobileSignUpScreen(),
                ],
              ),
              SizedBox(height: 10,),
              Text("@NextPass",style: Theme.of(context).textTheme.labelLarge,)
            ],
          ),
        ),
      ),
    );
  }
}
