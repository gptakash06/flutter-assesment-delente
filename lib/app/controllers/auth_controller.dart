import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_assessment/app/utils/helpers/shared_preferences.dart';
import 'package:flutter_assessment/app/utils/helpers/snackbar_helper.dart';

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';



class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var isLoading = false.obs;
  var user = Rx<User?>(null);

  @override
  void onInit() {
    user.bindStream(_auth.authStateChanges());
    super.onInit();
  }

  // Google Sign-In
  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return;

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await _auth.signInWithCredential(credential);
      SharedPrefsHelper.saveLoginState(googleAuth.idToken,googleAuth.accessToken);


// Save an integer value to 'counter' key.
//       await prefs.setInt('counter', 10);

      print(credential.accessToken);


    } catch (e) {
      SnackbarHelper.showError( "Google Sign-In failed: $e");
    }
  }



  // Sign Out
  Future<void> signOut() async {

   await SharedPrefsHelper.logout();
   await _auth.signOut();
    await GoogleSignIn().signOut();
    SnackbarHelper.showSuccess( "Logged out successfully");



  }
}
