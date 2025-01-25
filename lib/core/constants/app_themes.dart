import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.primary,
      textTheme: ButtonTextTheme.primary,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryDark,
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.primaryDark,
      textTheme: ButtonTextTheme.primary,
    ),
  );
}
