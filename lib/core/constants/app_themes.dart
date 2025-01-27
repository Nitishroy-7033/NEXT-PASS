import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppThemes {

  // Light Theme //
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    primaryColor: AppColors.primaryLight,
    // color scheme
    colorScheme: const ColorScheme.light(
      primary: AppColors.primaryLight,
      secondary: AppColors.secondaryLight,
      surface: AppColors.backgroundLight,
      primaryContainer: AppColors.primaryContainerLight,
      secondaryContainer: AppColors.secondaryContainerLight,
      tertiary: AppColors.labelLight,
      error: AppColors.error,
    ),
    //button theme
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.primaryLight,
      textTheme: ButtonTextTheme.primary,
    ),
  );

  // Dark Theme //
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    primaryColor: AppColors.primaryDark,
    // color scheme
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primaryDark,
      secondary: AppColors.secondaryDark,
      surface: AppColors.backgroundDark,
      primaryContainer: AppColors.primaryContainerDark,
      secondaryContainer: AppColors.secondaryContainerDark,
      tertiary: AppColors.labelDark,
      error: AppColors.error,
    ),
    // button theme
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.primaryDark,
      textTheme: ButtonTextTheme.primary,
    ),
  );
}
