import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:starting_todo_app/ui/onBoarding/onboarding_logic.dart';
import 'package:starting_todo_app/utils/color.dart';

import '../../generated/assets.dart';
import '../../utils/constant.dart';
import '../../utils/preference.dart';
import '../../utils/sizer_utils.dart';
import '../../widgets/common_button.dart';
import '../../widgets/common_text.dart';


class onBoardingView extends StatelessWidget {
  onBoardingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Get.theme.colorScheme.onBackground,
        body: GetBuilder<OnBoardingLogic>(
            id: Constant.idPageView,
            builder: (logic) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppPaddings.padding_20),
                child: Stack(
                  children: [
                    Container(
                      height: AppSizes.fullHeight / 1.7,
                      width: AppSizes.fullWidth,
                      alignment: Alignment.bottomCenter,
                      padding: const EdgeInsets.all(25),
                      child: SmoothPageIndicator(
                        controller: logic.pageController,
                        count: pagesImages.length,
                        effect: ExpandingDotsEffect(
                            activeDotColor: AppColor.colorPrimaryLightGreen,
                            dotColor: AppColor.gray,
                            dotHeight: 5,
                            dotWidth: 5),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: AppSizes.height_15),
                      child: PageView.builder(
                        onPageChanged: logic.onPageChanged,
                        controller: logic.pageController,
                        itemCount: pagesImages.length,
                        itemBuilder: (_, index) {
                          return pagesImages[index % pagesImages.length];
                        },
                      ),
                    ),
                    Positioned(
                      bottom: AppSizes.height_5_8,
                      left: AppSizes.height_3,
                      right: AppSizes.height_3,
                      child: Column(
                        children: [
                          CommonButton(
                            onTap: logic.onTapNext,
                            text: 'Next'.toUpperCase(),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            }));
  }

  final pagesImages = List.generate(3, (index) {
    List<String> listImagesUser = [
      Assets.imagesToto1,
      Assets.imagesTodo2,
      Assets.imagesTodo3,
    ];

    List<String> listIntroTextUser = [
      'It’s a list of tasks '.tr,
      'Write down in one place'.tr,
      'Helps you to stay organised'.tr
    ];
    return Container(
      color: Colors.transparent,
      child: Center(
        child: Column(
          children: [
            Image.asset(
              listImagesUser[index],
              width: index == 2 ? AppSizes.fullWidth / 1.1 : AppSizes.fullWidth / 1.3,
              height: AppSizes.fullHeight / 4,
              fit: BoxFit.contain,
            ),
            SizedBox(
              height: AppSizes.fullHeight / 3.9,
            ),
            CommonText(
              text: listIntroTextUser[index],
              textColor: AppColor.colorPrimaryLightGreen,
              textAlign: TextAlign.center,
              fontSize: AppFontSize.size_23,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),

      ),
    );
  });
}
