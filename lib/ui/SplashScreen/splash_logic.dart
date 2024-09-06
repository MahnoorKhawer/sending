import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';
import '../home/home_view.dart';
import '../onBoarding/onboarding_view.dart';

class SplashLogic extends GetxController {
  @override
  void onReady() {
    super.onReady();
    _navigateToNextScreen();
  }

  // Future<void> _navigateToNextScreen() async {
  //   await Future.delayed(const Duration(seconds: 3));
  //   String nextRoute = await checkLoginStatus();
  //   Get.offAllNamed(nextRoute);
  // }
  Future<void> _navigateToNextScreen() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null)
    {
      await Future.delayed(const Duration(seconds: 3));
      String nextRoute = await AppRoutes.home;
      Get.offAllNamed(nextRoute);
    }
    else{
      await Future.delayed(const Duration(seconds: 3));
      String nextRoute = await AppRoutes.onBoarding;
      Get.offAllNamed(nextRoute);
    }
  }

  // Future<String> checkLoginStatus() async {
  //   User? user = FirebaseAuth.instance.currentUser;
  //   if (user != null) {
  //     return AppRoutes.home;
  //   }
  //   else{
  //     return AppRoutes.onBoarding;
  //   }
  // }
}
