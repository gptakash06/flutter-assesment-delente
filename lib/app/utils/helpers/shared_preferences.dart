import 'package:flutter_assessment/app/views/screens/logout_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper{

 static Future<void> saveLoginState(String? idToken ,String? accessToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_idToken', idToken!); // Save user token
    await prefs.setString('auth_accessToken', accessToken!); // Save user token
    await prefs.setBool('is_logged_in', true); // Set logged-in state
  }

  static Future<bool> isUserLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('is_logged_in') ?? false;
  }

 static Future<void> logout() async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
   await prefs.remove('auth_idToken');
   await prefs.remove('auth_accessToken');
   await prefs.setBool('is_logged_in', false);

 }
}