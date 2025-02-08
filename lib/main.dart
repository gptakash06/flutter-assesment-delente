import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();




  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('es', 'ES'),
        Locale('fr', 'FR'),
      ],

      path: 'assets/lang', // Path to your translations folder
       fallbackLocale: const Locale('en', 'US'),
       startLocale: const Locale('en', 'US'),
      child:  App(), // This is where the localization context starts
    ),
  );
}

