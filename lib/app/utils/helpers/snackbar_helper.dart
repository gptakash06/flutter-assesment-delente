import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackbarHelper {
  static void showSuccess(String message) {
    Get.snackbar('Success', message,
        backgroundColor: Colors.green, colorText: Colors.white);
  }

  static void showError(String message) {
    Get.snackbar('Error', message,
        backgroundColor: Colors.red, colorText: Colors.white);
  }

  static void showInfo(String message) {
    Get.snackbar('Info', message,
        backgroundColor: Colors.blue, colorText: Colors.white);
  }
}
