import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:next_pass/core/constants/app_assets.dart';
import 'package:next_pass/core/widgets/primary_button.dart';

import '../../getx/controllers/auth_controller.dart';


class MobileSignUpScreen extends StatelessWidget {
  const MobileSignUpScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            SizedBox(
              height: 70,
            ),
            Image.asset(
              AppAssets.logo,
              height: 100,
              width: 100,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Create Account",
              style: TextStyle(
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                width: 380,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color.fromARGB(179, 230, 226, 226)),
                child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: "Enter Your Full Name",
                      border:
                          OutlineInputBorder(borderSide: BorderSide.none)),
                )),
            SizedBox(
              height: 20,
            ),
            Container(
                width: 380,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color.fromARGB(179, 230, 226, 226)),
                child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      hintText: "Enter Your Email",
                      border:
                          OutlineInputBorder(borderSide: BorderSide.none)),
                )),
            SizedBox(
              height: 20,
            ),
            Container(
                width: 380,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color.fromARGB(179, 230, 226, 226)),
                child: TextField(
                  decoration: InputDecoration(
                      suffixIcon: Icon(Icons.visibility),
                      prefixIcon: Icon(Icons.lock_outline),
                      hintText: "Create Password",
                      border:
                          OutlineInputBorder(borderSide: BorderSide.none)),
                )),
            SizedBox(
              height: 20,
            ),
            Container(
                width: 380,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color.fromARGB(179, 230, 226, 226)),
                child: TextField(
                  decoration: InputDecoration(
                      suffixIcon: Icon(Icons.visibility),
                      prefixIcon: Icon(Icons.lock_outline),
                      hintText: "Confirm Password",
                      border:
                          OutlineInputBorder(borderSide: BorderSide.none)),
                )),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 21),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                      value: _isChecked,
                      onChanged: (bool? Value) {
                        setState(() {
                          _isChecked = Value!;
                        });
                      }),
                  RichText(
                      text: TextSpan(
                          text: "I agree to the terms of service and ",
                          style: TextStyle(color: Colors.black,fontSize: 16),
                          children: <TextSpan>[
                        TextSpan(
                          text: "Privacy Policy",
                          style: TextStyle(color: Colors.blue,fontSize: 16),
                        ),
                      ]))
                ],
              ),
            ),
            SizedBox(height: 10,),
            PrimaryButton(
              onPressed: () {
                
              },
              text: "signup",
              icon: "",
            ),
                SizedBox(height: 20,),
                Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Divider(
                    thickness: 0.5,
                    color: Colors.black,
                    indent: 40,
                    endIndent: 5,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text("Or Sign up with"),
                ),
                Expanded(
                  child: Divider(
                    indent: 5,
                    endIndent: 40,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(border: Border.all(color: Colors.black),borderRadius: BorderRadius.circular(10)),
                  width: 100,
                  height: 45,
                  child: Center(child: Image.asset('assets/icons/google.png',width: 25,height: 25,)),
                ),
                Container(
                  decoration: BoxDecoration(border: Border.all(color: Colors.black),borderRadius: BorderRadius.circular(10)),
                  width: 100,
                  height: 45,
                  child: Center(child: Image.asset('assets/icons/apple.png',width: 25,height: 25,)),
                ),
                Container(
                  decoration: BoxDecoration(border: Border.all(color: Colors.black),borderRadius: BorderRadius.circular(10)),
                  width: 100,
                  height: 45,
                  child: Center(child: Image.asset('assets/icons/facebook.png',width: 25,height: 25,)),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 27),
              child: Text("By Signing Up, you agree to our Terms of service and privacy policy",
              style: TextStyle(fontSize: 16),),
            ),
            SizedBox(height: 10,),
            Text("Already Have an account? Sign in",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)
                
          ],
        ));
  }
}
