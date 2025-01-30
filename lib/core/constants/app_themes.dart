import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    colorScheme: const ColorScheme.light(
        surface: AppColors.backgroundLight,
        onSurface: AppColors.fontLight,
        primary: AppColors.primaryLight,
        secondary: AppColors.secondaryLight,
        primaryContainer: AppColors.primaryContainerLight,
        secondaryContainer: AppColors.secondaryContainerLight,
        tertiary: AppColors.labelLight,
        error: AppColors.error,
        onPrimaryContainer: AppColors.fontLight,
        onSecondaryContainer: AppColors.labelLight),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.fontLight,
        fontFamily: "Montserrat",
      ),
      headlineMedium: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: AppColors.fontLight,
        fontFamily: "Montserrat",
      ),
      headlineSmall: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: AppColors.fontLight,
        fontFamily: "Montserrat",
      ),
      bodyLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: AppColors.fontLight,
        fontFamily: "Montserrat",
      ),
      bodyMedium: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: AppColors.fontLight,
        fontFamily: "Montserrat",
      ),
      bodySmall: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: AppColors.fontLight,
        fontFamily: "Montserrat",
      ),
      labelLarge: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: AppColors.labelLight,
        fontFamily: "Montserrat",
      ),
      labelMedium: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: AppColors.labelLight,
        fontFamily: "Montserrat",
      ),
      labelSmall: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        color: AppColors.labelLight,
        fontFamily: "Montserrat",
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primaryLight,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.backgroundLight,
        fontFamily: "Montserrat",
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: AppColors.labelLight,
        fontFamily: "Montserrat",
      ),
      labelStyle: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: AppColors.labelLight,
        fontFamily: "Montserrat",
      ),
      fillColor: AppColors.primaryLight.withOpacity(0.1),
      filled: true,
      border: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryLight,width: 2)),
      focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryLight,width: 2)),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.primaryLight,
      textTheme: ButtonTextTheme.primary,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    colorScheme: const ColorScheme.dark(
        surface: AppColors.backgroundDark,
        onSurface: AppColors.fontDark,
        primary: AppColors.primaryDark,
        secondary: AppColors.secondaryDark,
        primaryContainer: AppColors.primaryContainerDark,
        secondaryContainer: AppColors.secondaryContainerDark,
        tertiary: AppColors.labelDark,
        error: AppColors.error,
        onPrimaryContainer: AppColors.fontDark,
        onSecondaryContainer: AppColors.labelDark),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primaryDark,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.fontDark,
        fontFamily: "Montserrat",
      ),
    ),
     inputDecorationTheme: InputDecorationTheme(
      hintStyle: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: AppColors.labelDark,
        fontFamily: "Montserrat",
      ),
      labelStyle: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: AppColors.labelDark,
        fontFamily: "Montserrat",
      ),
      fillColor: AppColors.primaryDark.withOpacity(0.1),
      filled: true,
      border: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryDark,width: 2)),
      focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryDark,width: 2)),
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.fontDark,
        fontFamily: "Montserrat",
      ),
      headlineMedium: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: AppColors.fontDark,
        fontFamily: "Montserrat",
      ),
      headlineSmall: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: AppColors.fontDark,
        fontFamily: "Montserrat",
      ),
      bodyLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: AppColors.fontDark,
        fontFamily: "Montserrat",
      ),
      bodyMedium: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: AppColors.fontDark,
        fontFamily: "Montserrat",
      ),
      bodySmall: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: AppColors.fontDark,
        fontFamily: "Montserrat",
      ),
      labelLarge: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: AppColors.labelDark,
        fontFamily: "Montserrat",
      ),
      labelMedium: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: AppColors.labelDark,
        fontFamily: "Montserrat",
      ),
      labelSmall: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        color: AppColors.labelDark,
        fontFamily: "Montserrat",
      ),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.primaryDark,
      textTheme: ButtonTextTheme.primary,
    ),
  );
}
