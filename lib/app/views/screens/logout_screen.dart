import 'package:flutter/material.dart';
import 'package:flutter_assessment/app/views/screens/auth_screen.dart';
import 'package:flutter_assessment/app/views/screens/home_screen.dart';
import 'package:flutter_assessment/app/views/widgets/common_text_widget.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../generated/lib/generated/locale_keys.g.dart';
import '../../controllers/auth_controller.dart';
import '../../utils/helpers/navigation_helper.dart';
import '../widgets/common_appBar_widget.dart';

class LogoutScreen extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBarWidget(
        title: LocaleKeys.logout,
        leading:
        IconButton(
          icon: const Icon(Icons.arrow_back,color: Colors.white,),
          onPressed: () {
            NavigationHelper.goBack();
          },
        ),

      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Obx(() {
          if (authController.user.value != null) {
            return  _buildProfileUI(context);
          }
          else {
            return HomeScreen() ;

          }
        }),
      ),
    );
  }




  Widget _buildProfileUI(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            authController.user.value!.photoURL == null
                ? _shimmerAvatar()
                : CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(authController.user.value!.photoURL!),
            ),
            SizedBox(height: 20),
            CommonTextWidget(
              style:theme.textTheme.bodyMedium?.copyWith(fontSize: 22, fontWeight: FontWeight.bold),
             // TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              text: authController.user.value!.displayName ?? "User",
            ),
            SizedBox(height: 5),
            CommonTextWidget(
              text: authController.user.value!.email ?? "No Email",
                style: theme.textTheme.bodyMedium?.copyWith(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.grey)

            ),
            SizedBox(height: 20),
            _socialButton(
              text: LocaleKeys.logout,
              icon: FontAwesomeIcons.signOutAlt,
              color: Colors.white,
              onPressed:(){
                authController.signOut();
                Get.to(() =>  AuthScreen());


              }


            ),
          ],
        ),
      ),
    );
  }

  //  Custom Social Button Widget
  Widget _socialButton({required String text, required IconData icon, required Color color, required VoidCallback onPressed}) {
    return ElevatedButton.icon(
      icon: Icon(icon, color: Colors.white),
      label: CommonTextWidget(text: text, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
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
