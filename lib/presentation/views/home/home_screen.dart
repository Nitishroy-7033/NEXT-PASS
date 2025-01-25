import 'package:flutter/material.dart';
import 'package:next_pass/core/utils/responsive.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(mobile: , tablet: tablet, desktop: desktop),
    );
  }
}