import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../generated/assets.dart';
import 'splash_logic.dart';

class SplashViewPage extends StatelessWidget {
  const SplashViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Get.theme.colorScheme.onBackground,
        extendBodyBehindAppBar: true,
        body: GetBuilder<SplashLogic>(builder: (logic) {
          return Center(
            child: Image.asset(
              Assets.imagesTodo,
              width: 200,
              height: 200,
              fit: BoxFit.fill,
            ),
          );
        }));
  }
}
