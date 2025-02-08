import 'package:flutter/material.dart';
import 'package:flutter_assessment/app/views/screens/home_screen.dart';
import 'package:flutter_assessment/app/views/widgets/common_text_widget.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../generated/lib/generated/locale_keys.g.dart';
import '../../controllers/auth_controller.dart';

class AuthScreen extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Obx(() {
          if (authController.user.value == null) {
            return _buildLoginUI();
          } else {
            return HomeScreen();
          }
        }),
      ),
    );
  }

  // 🔹 UI for Login Screen
  Widget _buildLoginUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/images/login_illustration.png", height: 200), // Add an illustration
        SizedBox(height: 30),
        _socialButton(
          text: LocaleKeys.sign_in_google,
          icon: FontAwesomeIcons.google,
          color: Colors.redAccent,
          onPressed: authController.signInWithGoogle,
        ),
        SizedBox(height: 15),
        _socialButton(
          text: "Continue Without Login",
          icon: Icons.person,
          color: Colors.grey,
          onPressed: () {
            Get.to(() => HomeScreen());
          },
        ),
      ],
    );
  }

  //  Custom Social Button Widget
  Widget _socialButton({
    required String text,
    required IconData icon,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton.icon(
      icon: Icon(icon, color: Colors.white),
      label: CommonTextWidget(
        text: text,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
      ),
      onPressed: onPressed,
    );
  }

  //  Shimmer effect for loading avatar
  Widget _shimmerAvatar() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: CircleAvatar(radius: 50, backgroundColor: Colors.white),
    );
  }
}
