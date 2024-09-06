import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:starting_todo_app/routes/app_routes.dart';


class LogoutController extends GetxController{

  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();

      final GoogleSignIn googleSignIn = GoogleSignIn();
      if (await googleSignIn.isSignedIn()) {
        await googleSignIn.signOut();
      }
      Get.offAllNamed(AppRoutes.LoginIn);
    } catch (e) {
      print('Error signing out: $e');
      Get.snackbar('Error', 'Failed to sign out. Please try again.');
    }
  }

// ElevatedButton(
// style: ElevatedButton.styleFrom(
// foregroundColor: AppColor.darkGreen,
// backgroundColor: AppColor.colorGreen,
// ),
// onPressed: (){
// controller.logout();
// },
// child: Text('Log out')),
}
