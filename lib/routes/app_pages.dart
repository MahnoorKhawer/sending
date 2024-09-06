import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:starting_todo_app/Logout/LogoutView.dart';
import 'package:starting_todo_app/Logout/logoutBinding.dart';
import 'package:starting_todo_app/progress/progress_binding.dart';
import 'package:starting_todo_app/progress/progress_view.dart';
import 'package:starting_todo_app/ui/Login/login_binding.dart';
import 'package:starting_todo_app/ui/Login/login_view.dart';
import 'package:starting_todo_app/ui/SignIn/signin_binding.dart';
import 'package:starting_todo_app/ui/SignIn/signin_view.dart';
import 'package:starting_todo_app/ui/calender/calenderbinding.dart';
import 'package:starting_todo_app/ui/calender/calenderview.dart';
import 'package:starting_todo_app/ui/notification/notificationBinding.dart';
import 'package:starting_todo_app/ui/notification/notificationView.dart';
import 'package:starting_todo_app/ui/onBoarding/onboarding_binding.dart';
import 'package:starting_todo_app/ui/onBoarding/onboarding_view.dart';
import '../ui/SplashScreen/splash_binding.dart';
import '../ui/SplashScreen/splashview.dart';
import '../ui/home/home_binding.dart';
import '../ui/home/home_view.dart';

import 'app_routes.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashViewPage(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.calender,
      page: () =>  CalendarView(),
      binding: CalenderBinding(),
    ),
    GetPage(
      name: AppRoutes.progress,
      page: () =>  ProgressView(),
      binding: ProgressBinding(),
    ),
    GetPage(
      name: AppRoutes.Logout,
      page: () =>  Logoutview(),
      binding: Logoutbinding(),
    ),
    // GetPage(
    //   name: AppRoutes.notification,
    //   page: () =>  Notificationview(),
    //   binding: Notificationbinding(),
    // ),
    GetPage(
      name: AppRoutes.home,
      page: () =>  HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.onBoarding,
      page: () => onBoardingView(),
      binding: OnBoardingBinding(),
    ),
    GetPage(
      name: AppRoutes.SignIn,
      page: () =>  SignUpScreen(),
      binding: SigninBinding(),
    ),
    GetPage(
      name: AppRoutes.LoginIn,
      page: () => const LoginInScreen(),
      binding: LoginBinding(),
    ),
  ];
}
