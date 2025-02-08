import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';
import '../../controllers/language_controller.dart';
import '../../controllers/payment_controller.dart';
import '../../controllers/stock_controller.dart';
import '../../controllers/theme_controller.dart';

class NetworkBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<PaymentController>(() =>PaymentController(),fenix: true );
    Get.lazyPut<StockController>(() =>StockController(),fenix: true );
    Get.lazyPut<ThemeController>(() =>ThemeController(),fenix: true );
    Get.lazyPut<LanguageController>(() =>LanguageController(),fenix: true );
    Get.lazyPut<AuthController>(() =>AuthController(),fenix: true );
  }

}