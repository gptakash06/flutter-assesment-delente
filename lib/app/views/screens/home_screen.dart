import 'package:flutter/material.dart';
import 'package:flutter_assessment/app/utils/themes/colors.dart';
import 'package:flutter_assessment/app/views/screens/stock_detail_screen.dart';
import 'package:get/get.dart';
import '../../../generated/lib/generated/locale_keys.g.dart';
import '../../controllers/auth_controller.dart';
import '../../controllers/language_controller.dart';
import '../../controllers/payment_controller.dart';
import '../../controllers/stock_controller.dart';
import '../../controllers/theme_controller.dart';
import '../widgets/common_appBar_widget.dart';
import '../widgets/common_text_widget.dart';
import 'logout_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final LanguageController languageController = Get.find();
  final ThemeController themeController = Get.find();
  final StockController controller = Get.put(StockController());
  final AuthController authController = Get.put(AuthController());
  final PaymentController paymentController = Get.put(PaymentController());


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(

      appBar: CommonAppBarWidget(
        title: LocaleKeys.home,
        actions: [
          _buildThemeToggle(),
          _buildLanguageSelector(),
        ],
      ),
      body: Obx(() {
        if (controller.stockList.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        return Stack(
          children: [ListView.builder(
            itemCount: controller.stockList.length,
            padding: const EdgeInsets.all(8),
            itemBuilder: (context, index) {
              final stock = controller.stockList[index];

              return Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 4,
                margin: const EdgeInsets.only(bottom: 12),
                child: Column(
                  children: [
                    ListTile(
                      contentPadding: const EdgeInsets.all(12),
                      leading: CircleAvatar(
                        backgroundColor: Colors.blueAccent,
                        child: CommonTextWidget(
                          text: stock.symbol[0],
                          style: theme.textTheme.bodyMedium,
                        ),
                      ),
                      title: CommonTextWidget(
                        text: stock.companyName,
                        style: theme.textTheme.bodyMedium
                            ?.copyWith(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      subtitle: CommonTextWidget(text: stock.symbol,
                          style:theme.textTheme.bodyMedium?.copyWith(fontSize: 16, fontWeight: FontWeight.bold)),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CommonTextWidget(
                            text: "\$${stock.price}",
                            style:theme.textTheme.bodyMedium?.copyWith(fontSize: 16, fontWeight: FontWeight.bold)

                          ),
                          CommonTextWidget(
                            text: "${stock.change} (${stock.percentageChange}%)",
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: stock.change >= 0 ? Colors.green : Colors.red,
                            ),
                          ),
                        ],
                      ),
                      onTap: () => Get.to(() => StockDetailScreen(stock.symbol ?? "")),
                      dense: true,
                    ),
                    _buildBuyButton(stock.price.toInt()),
                    const SizedBox(height: 10),
                  ],
                ),
              );
            },
          ),
            Center(child:paymentController.isLoading.value ? CircularProgressIndicator(
        strokeWidth: 2,
        color: Colors.white,
        ):null

            )
        ]
        );
      }),

      floatingActionButton: Obx(() {
        return FloatingActionButton.extended(
          onPressed: () async {
            if (authController.user.value == null) {
              authController.isLoading.value = true;
              await authController.signInWithGoogle();
              authController.isLoading.value = false;
            } else {
              Get.to(() => LogoutScreen());
            }
          },
          backgroundColor: authController.user.value == null ? Colors.blue : Colors.red,
          icon: Obx(() => authController.isLoading.value
              ? SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: Colors.white,
            ),
          )
              : Icon(authController.user.value == null ? Icons.login : Icons.logout, color: Colors.white)),
          label: Obx(() => CommonTextWidget(
            text: authController.user.value == null ? LocaleKeys.sign_in_google : LocaleKeys.logout,
            style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white),
          )),
        );
      }),




    );
  }

  /// Buy Now Button with Circular Progress in Center
  Widget _buildBuyButton(int amount) {
    final theme = Theme.of(context);
    return Obx(() => SizedBox(
      height: 40,
      width: 150,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        onPressed: paymentController.isLoading.value
            ? null // Disable button when loading
            : () {
          paymentController.startRazorpayPayment(amount: amount);
        },
        child: CommonTextWidget(
                  text: LocaleKeys.buy_now,
                  style: theme.textTheme.bodyMedium?.copyWith(color: AppColors.textDark),
                ),


      ),
    ));
  }

  /// Theme Toggle Button
  Widget _buildThemeToggle() {
    return GetBuilder<ThemeController>(
      builder: (controller) => IconButton(
        icon: Icon(
          controller.isDarkMode.value ? Icons.dark_mode : Icons.light_mode,
          color: Colors.white,
        ),
        onPressed: controller.toggleTheme,
      ),
    );
  }

  /// Language Selector Button
  Widget _buildLanguageSelector() {
    return IconButton(
      icon: const Icon(Icons.language, color: Colors.white),
      onPressed: () => _showLanguageDialog(context),
    );
  }

  /// Language Selection Dialog
  void _showLanguageDialog(BuildContext context) {
    final theme = Theme.of(context);
    showDialog(
      context: context,

      builder: (BuildContext context) {
        return AlertDialog(

          title: CommonTextWidget(text: LocaleKeys.change_language,style: theme.textTheme.bodyMedium,),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _languageButton('English', const Locale('en', 'US')),
              _languageButton('Español', const Locale('es', 'ES')),
              _languageButton('Français', const Locale('fr', 'FR')),
            ],
          ),
        );
      },
    );
  }

  /// Language Option Button
  Widget _languageButton(String language, Locale locale) {
    final theme = Theme.of(context);
    return ListTile(
      title: CommonTextWidget(text: language,style:theme.textTheme.bodyMedium,),
      onTap: () {
        languageController.changeLanguage(locale);
        Get.back();
      },
    );
  }
}
