import 'dart:convert';
import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:starting_todo_app/ui/firebase_auth/firebase_auth_service.dart';
import '../../../utils/constant.dart';
import '../../../utils/preference.dart';
import '../../routes/app_routes.dart';


class SignInController extends GetxController {

  final FirebaseAuthService _auth= FirebaseAuthService();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController name = TextEditingController();

  bool isShowProgress = false;
  bool isShowPassword = true;

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
    ],
  );

  void signUp() async {

    if (formKey.currentState?.validate() ?? false) {
      String name = nameController.text;
      String email = emailController.text;
      String password = passwordController.text;

      try {
        User? user = await _auth.signUpWithEmailAndPassword(email, password);
        if (user != null) {
          print('User is successfully Sign Up');
          Get.offAllNamed(AppRoutes.home);
        }
      } on FirebaseAuthException catch (e) {
        print('SignUp failed: ${e.message}');
        Get.snackbar('SignUp Failed', e.message ?? 'An error occurred',
            snackPosition: SnackPosition.BOTTOM);
      }
    }
  }

  signInWithGoogle()async{
    final GoogleSignIn _googleSignIn= GoogleSignIn();
    try{
      final GoogleSignInAccount? googleSignInAccount= await _googleSignIn.signIn();
      if (googleSignInAccount!=null){
        final GoogleSignInAuthentication googleSignInAuthentication=
            await googleSignInAccount.authentication;

        final AuthCredential credential= GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );
        await _auth.signInWithCredential(credential);
      }
    }
        catch(e){
        print('some error occured');
        }
  }

  @override
  String? isEmailValid(String email) {
    if (email == null || email.isEmpty) {
      return 'Please enter your email';
    } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
        .hasMatch(email)) {
      return 'Please enter a valid email';
    }
    return null;
  }
  String? isNameValid(String name){
    if (name == null || name.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

  String? isPasswordValid(String value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;

  }

  // String generateNonce([int length = 32]) {
  //   const charset =
  //       '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
  //   final random = Random.secure();
  //   return List.generate(length, (_) => charset[random.nextInt(charset.length)])
  //       .join();
  // }

  Future<void> logoutGoogle() async {
    await _googleSignIn.signOut();
  }

  void toggleShowHidePassword() {
    isShowPassword = !isShowPassword;
    update([Constant.idPasswordInput]);
  }
}
