import 'package:flutter/material.dart';
import 'package:starting_todo_app/utils/color.dart';

import '../../../generated/assets.dart';
class MyHeaderDrawer extends StatefulWidget {
  const MyHeaderDrawer({super.key});

  @override
  State<MyHeaderDrawer> createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.colorGreen,
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.fitHeight,
                  image: AssetImage(Assets.imagesTask)),
            ),
          ),
          Text('ToDo Drawer',style: TextStyle(color: AppColor.darkGreen,fontSize: 20),),
          Text('List of menu drawer',style: TextStyle(color: AppColor.darkGreen,fontSize: 15),),
        ],
      ),
    );
  }
}

enum DrawerSections{
  dashboard,
  about,
  logout,

}
