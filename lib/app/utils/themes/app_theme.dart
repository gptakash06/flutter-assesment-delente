import 'package:flutter/material.dart';
import 'package:flutter_assessment/app/utils/themes/bottom_nav_styles.dart';
import 'package:flutter_assessment/app/utils/themes/button_styles.dart';
import 'package:flutter_assessment/app/utils/themes/colors.dart';
import 'package:flutter_assessment/app/utils/themes/text_theme.dart';

class AppTheme {
  // Light Theme
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    primaryColor: AppColors.primaryLight,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryLight,
      titleTextStyle: AppTextStyles.appBarTitle(isDarkMode: false),
    ),
    textTheme: TextTheme(
      headlineLarge: AppTextStyles.headlineLarge(isDarkMode: false),
      bodyLarge: AppTextStyles.bodyLarge(isDarkMode: false),
      bodySmall: AppTextStyles.bodyMicro(isDarkMode: false),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyles.elevatedButton(false),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyles.outlinedButton(false),
    ),
    bottomNavigationBarTheme: BottomNavStyles.bottomNavTheme(false),
  );

  // Dark Theme
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    primaryColor: AppColors.primaryDark,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryDark,
      titleTextStyle: AppTextStyles.appBarTitle(isDarkMode: false),
    ),
    textTheme: TextTheme(
      headlineLarge: AppTextStyles.headlineLarge(isDarkMode: false),
      bodyLarge: AppTextStyles.bodyLarge(isDarkMode: false),
      bodySmall: AppTextStyles.bodyMicro(isDarkMode: false),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyles.elevatedButton(true),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyles.outlinedButton(true),
    ),
    bottomNavigationBarTheme: BottomNavStyles.bottomNavTheme(true),
  );
}
