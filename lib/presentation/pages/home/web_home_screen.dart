import 'package:flutter/material.dart';

class WebHomeScreen extends StatelessWidget {
  const WebHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
         backgroundColor: Colors.deepPurple,
      body: SafeArea(child: Column(children: [
        Text("Web Home Page")

      ],),)
    );;
  }
}