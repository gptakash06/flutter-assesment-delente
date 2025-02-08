import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assessment/app/controllers/language_controller.dart';
import 'package:flutter_assessment/app/utils/helpers/network_binding.dart';
import 'package:flutter_assessment/app/utils/helpers/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app/controllers/theme_controller.dart';
import 'app/views/screens/auth_screen.dart';
import 'app/views/screens/home_screen.dart';
import 'app/utils/themes/app_theme.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}


class _AppState extends State<App> {
  bool isUserLoggedIN=false;



  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    isUserLoggedIN = await  SharedPrefsHelper.isUserLoggedIn();
    print("ABC"+isUserLoggedIN.toString());

  }

  @override
  Widget build(BuildContext context) {
    // Get the ThemeController to manage the theme state.
    final ThemeController themeController = Get.put(ThemeController());

    print("AAA"+context.locale.toString());

    // This will automatically detect and change the theme based on the controller's state.
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      initialBinding: NetworkBinding(),

      title: 'Multi-Language App',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeController.isDarkMode.value ? ThemeMode.dark : ThemeMode.light, // Toggle between dark and light theme
      home: isUserLoggedIN ? HomeScreen() : AuthScreen(),
    );
  }
}
