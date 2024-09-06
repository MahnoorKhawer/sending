import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:sizer/sizer.dart';
import 'package:starting_todo_app/routes/app_pages.dart';
import 'package:starting_todo_app/routes/app_routes.dart';
import 'package:starting_todo_app/ui/notification/notificationLogic.dart';
import 'package:starting_todo_app/utils/color.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'firebase_options.dart';


int id = 0;
DateTime? currentBackPressTime;

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: AppColor.transparent));

  WidgetsFlutterBinding.ensureInitialized();
  Notificationlogic().initNotification();
  tz.initializeTimeZones();
  await Firebase.initializeApp();
  //tz.initializeTimeZones();
  //tz.initializeTimeZones();
  // final String timeZoneName = await tz.local.name;
  // tz.setLocalLocation(tz.getLocation(timeZoneName));

  // Initialize notifications
  // final Notificationlogic notificationlogic = Get.put(Notificationlogic());
  // await notificationlogic.initNotification();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          theme: ThemeData(
            primaryColor: AppColor.white,
            scaffoldBackgroundColor: AppColor.white,
          ),
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          getPages: AppPages.list,
          defaultTransition: Transition.fade,
          transitionDuration: const Duration(milliseconds: 200),
          initialRoute: AppRoutes.progress,
        );
      },
    );
  }
}
