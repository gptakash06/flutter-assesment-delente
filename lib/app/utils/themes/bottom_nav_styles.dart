import 'package:flutter/material.dart';
import 'package:flutter_assessment/app/utils/themes/colors.dart';

class BottomNavStyles {
  static BottomNavigationBarThemeData bottomNavTheme(bool isDarkMode) =>
      BottomNavigationBarThemeData(
        backgroundColor:
            isDarkMode ? AppColors.backgroundDark : AppColors.backgroundLight,
        selectedItemColor:
            isDarkMode ? AppColors.primaryDark : AppColors.primaryLight,
        unselectedItemColor: isDarkMode ? Colors.white70 : Colors.black54,
      );
}
