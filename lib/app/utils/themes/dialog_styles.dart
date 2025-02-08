import 'package:flutter/material.dart';

class DialogStyles {
  static DialogTheme dialogTheme(bool isDarkMode) => DialogTheme(
    backgroundColor: isDarkMode ? Colors.grey[800] : Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: isDarkMode ? Colors.white : Colors.black,
    ),
    contentTextStyle: TextStyle(
      fontSize: 16,
      color: isDarkMode ? Colors.white70 : Colors.black87,
    ),
  );
}
