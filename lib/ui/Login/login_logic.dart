import 'dart:convert';
import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:starting_todo_app/ui/Login/login_view.dart';
import 'package:starting_todo_app/ui/firebase_auth/firebase_auth_service.dart';
import 'package:starting_todo_app/ui/home/home_view.dart';
import 'package:starting_todo_app/ui/onBoarding/onboarding_view.dart';
import '../../../utils/constant.dart';
import '../../../utils/preference.dart';
import '../../routes/app_routes.dart';


class LoginInController extends GetxController {


  final FirebaseAuthService _auth= FirebaseAuthService();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  bool isShowProgress = false;
  bool isShowPassword = true;

  @override
  void signIn() async {

    if (formKey.currentState?.validate() ?? false) {
      String email = emailController.text;
      String password = passwordController.text;

      try {
        User? user = await _auth.signInWithEmailAndPassword(email, password);
        if (user != null) {
          print('User is successfully logged in');
          Get.offAllNamed(AppRoutes.home); // Navigate to home after successful login
        }
      } on FirebaseAuthException catch (e) {
        print('Login failed: ${e.message}');
        Get.snackbar('Login Failed', e.message ?? 'An error occurred',
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

  // Future<void> logoutGoogle() async {
  //   await _googleSignIn.signOut();
  // }

  void toggleShowHidePassword() {
    isShowPassword = !isShowPassword;
    update([Constant.idPasswordInput]);
  }
}
