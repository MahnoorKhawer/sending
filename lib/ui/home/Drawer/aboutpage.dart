import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:starting_todo_app/utils/color.dart';

import '../../../routes/app_routes.dart';
class Aboutpage extends StatelessWidget {
  const Aboutpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(child: Text('This is simple ToDo App, where You can add Tasks list and on Completion you can just delete prevoius tasks and add new task according to your desire.\n Additionally in this app there is a Calender Task option where you can just set your task according to calender dates and also when completed you can remove that task!',style: TextStyle(color: AppColor.darkGreen),)),
              SizedBox(height: 20,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.colorGreen,
                  foregroundColor: AppColor.darkGreen,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60),
                  ),
                  minimumSize: Size(100, 40),
                ),
                onPressed: () {
                  Get.offAllNamed(AppRoutes.home);
                },
                child: Text('Back',style: TextStyle(color: AppColor.white),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
