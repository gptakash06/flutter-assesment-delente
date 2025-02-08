import 'package:flutter/material.dart';
import 'package:flutter_assessment/app/utils/themes/colors.dart';

class TextFieldStyles {
  static InputDecoration textFieldDecoration(bool isDarkMode) =>
      InputDecoration(
        filled: true,
        fillColor: isDarkMode ? AppColors.cardDark : AppColors.cardLight,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
              color: isDarkMode ? AppColors.textDark : AppColors.textLight),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
              color:
                  isDarkMode ? AppColors.primaryDark : AppColors.primaryLight),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
              color:
                  isDarkMode ? AppColors.primaryDark : AppColors.primaryLight),
        ),
      );
}
