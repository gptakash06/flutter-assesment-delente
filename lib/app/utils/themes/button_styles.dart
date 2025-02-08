import 'package:flutter/material.dart';
import 'package:flutter_assessment/app/utils/themes/colors.dart';

class ButtonStyles {
  static ButtonStyle elevatedButton(bool isDarkMode) =>
      ElevatedButton.styleFrom(
        backgroundColor:
            isDarkMode ? AppColors.primaryDark : AppColors.primaryLight,
        foregroundColor: isDarkMode ? AppColors.textDark : AppColors.textLight,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      );

  static ButtonStyle outlinedButton(bool isDarkMode) =>
      OutlinedButton.styleFrom(
        side: BorderSide(
            color: isDarkMode ? AppColors.primaryDark : AppColors.primaryLight),
        foregroundColor:
            isDarkMode ? AppColors.primaryDark : AppColors.primaryLight,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      );
}
