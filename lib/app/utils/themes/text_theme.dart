import 'package:flutter/material.dart';

class AppTextStyles {
  static TextStyle bodyExtraLarge(
      {required bool isDarkMode, Color? lightColor, Color? darkColor}) {
    return TextStyle(
      fontFamily: 'OpenSans', // Using the local font
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color:
      isDarkMode ? darkColor ?? Colors.white : lightColor ?? Colors.black,
    );
  }

  static TextStyle bodyLarge(
      {required bool isDarkMode, Color? lightColor, Color? darkColor}) {
    return TextStyle(
      fontFamily: 'OpenSans', // Using the local font
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color:
      isDarkMode ? darkColor ?? Colors.white : lightColor ?? Colors.black,
    );
  }

  static TextStyle bodyMedium(
      {required bool isDarkMode, Color? lightColor, Color? darkColor}) {
    return TextStyle(
      fontFamily: 'OpenSans', // Using the local font
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: isDarkMode
          ? darkColor ?? Colors.white70
          : lightColor ?? Colors.black87,
    );
  }

  static TextStyle bodyMicro(
      {required bool isDarkMode, Color? lightColor, Color? darkColor}) {
    return TextStyle(
      fontFamily: 'OpenSans', // Using the local font
      fontSize: 10,
      fontWeight: FontWeight.w300,
      color: isDarkMode
          ? darkColor ?? Colors.white60
          : lightColor ?? Colors.black54,
    );
  }

  static TextStyle headlineLarge(
      {required bool isDarkMode, Color? lightColor, Color? darkColor}) {
    return TextStyle(
      fontFamily: 'Lato', // Using the local font
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color:
      isDarkMode ? darkColor ?? Colors.white : lightColor ?? Colors.black,
    );
  }

  static TextStyle headlineMedium(
      {required bool isDarkMode, Color? lightColor, Color? darkColor}) {
    return TextStyle(
      fontFamily: 'Lato', // Using the local font
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: isDarkMode
          ? darkColor ?? Colors.white70
          : lightColor ?? Colors.black87,
    );
  }

  static TextStyle appBarTitle(
      {required bool isDarkMode, Color? lightColor, Color? darkColor}) {
    return TextStyle(
      fontFamily: 'Lato', // Using the local font
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color:
      isDarkMode ? darkColor ?? Colors.white : lightColor ?? Colors.black,
    );
  }
}
