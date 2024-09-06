import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:starting_todo_app/utils/color.dart';
import '../routes/app_routes.dart';
import '../utils/constant.dart';
import 'LogoutLogic.dart';


class Logoutview extends StatefulWidget {
  const Logoutview({super.key});

  @override
  State<Logoutview> createState() => _LogoutviewState();
}

class _LogoutviewState extends State<Logoutview> {
  final LogoutController controller = Get.put(LogoutController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<LogoutController>(
            id: Constant.idHome,
            builder: (logic){
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Do You Want to Logout?',style: TextStyle(color: AppColor.darkGreen),),
                    SizedBox(height: 10,),
                    ElevatedButton(
                    style: ElevatedButton.styleFrom(
                    foregroundColor: AppColor.darkGreen,
                    backgroundColor: AppColor.colorGreen,
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60),
                     ),
                     ),
                     onPressed: (){
                     controller.logout();
                      },
                    child: Text('Log out',style: TextStyle(color: AppColor.white),)),
                      SizedBox(height: 10,),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.colorGreen,
                          foregroundColor: AppColor.darkGreen,
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(60),
                          ),
                        ),
                        onPressed: () {
                          Get.offAllNamed(AppRoutes.home);
                        },
                        child: Text('Back',style: TextStyle(color: AppColor.white),),
                      ),
                ],
                ),
              );
            }
        ),
      ),
    );
  }
}
