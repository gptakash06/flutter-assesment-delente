// navigation_helper.dart

import 'package:get/get.dart';

class NavigationHelper {
  /// Navigate to a new screen
  static void navigateTo(String routeName, {Object? arguments}) {
    Get.toNamed(routeName, arguments: arguments);
  }

  /// Navigate to a new screen and remove the previous screen from the stack
  static void navigateAndRemove(String routeName, {Object? arguments}) {
    Get.offNamed(routeName, arguments: arguments);
  }

  /// Navigate to a new screen and clear the entire stack
  static void resetNavigation(String routeName, {Object? arguments}) {
    Get.offAllNamed(routeName, arguments: arguments);
  }

  /// Navigate back to the previous screen
  static void goBack() {
    Get.back();
  }

  /// Navigate back to a specific number of screens
  static void goBackWithCount(int count) {
    Get.back(result: count);
  }



}
