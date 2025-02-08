import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double fontSize;

  const CustomTextButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.fontSize = 16.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primaryLight, // Text color (blue)
        padding: EdgeInsets.zero, // No extra padding
        tapTargetSize: MaterialTapTargetSize.shrinkWrap, // Reduces button tap area
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          color: AppColors.primaryLight, // Blue text color
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
