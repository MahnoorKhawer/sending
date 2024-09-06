import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:starting_todo_app/progress/progress_logic.dart';
import 'package:starting_todo_app/utils/color.dart';

class ProgressView extends StatelessWidget {
  const ProgressView({super.key});

  @override
  Widget build(BuildContext context) {
    final ProgressController controller = Get.put(ProgressController());

    return Scaffold(
     body: GetBuilder<ProgressController>(builder: (logic){
       return Padding(
         padding: const EdgeInsets.symmetric(horizontal: 20),
         child: Center(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Container(
                 child: CircularPercentIndicator(
                   radius: 80,
                   lineWidth: 28,
                   percent: controller.percent.value,
                   backgroundColor: AppColor.gray,
                   circularStrokeCap: CircularStrokeCap.round,
                   center: Text(
                     '${(controller.percent.value * 100).toInt()}%',
                     style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                   ),
                   progressColor: AppColor.colorGreen,
                 ),
               ),
               SizedBox(height: 50,),
               Container(
                 child: ListTile(
                   leading: Container(
                     height: 34,
                     width: 34,
                     decoration: BoxDecoration(
                       color: AppColor.colorGreen,
                       shape: BoxShape.circle, // Make the background circular
                     ),
                     child: Padding(
                       padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
                       child: SvgPicture.asset(
                         'assets/icons/ic_gallery.svg',
                         color: Colors.white, // Foreground color (white)
                       ),
                     ),
                   ),
                   title: Text('Images', style: TextStyle(fontWeight: FontWeight.bold),),
                   subtitle: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text('1,432 items . 6.8 GB', style: TextStyle(color: AppColor.gray, fontSize: 12, fontWeight: FontWeight.bold),),
                       SizedBox(
                         width: 100,
                         child: ClipRRect(
                           borderRadius: BorderRadius.all(Radius.circular(10)),
                           child: LinearPercentIndicator(
                             lineHeight: 6,
                             percent: 0.5,
                             backgroundColor: Colors.grey[300],
                             progressColor: AppColor.colorGreen,
                             barRadius: Radius.circular(10),
                             padding: EdgeInsets.zero,
                           ),
                         ),
                       ),
                     ],
                   ),
                 ),
               ),
               SizedBox(height: 5,),
               Container(
                 child: ListTile(
                   leading: Container(
                     height: 34,
                     width: 34,
                     decoration: BoxDecoration(
                       color: AppColor.colorGreen,
                       shape: BoxShape.circle, // Make the background circular
                     ),
                     child: Padding(
                       padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
                       child: SvgPicture.asset(
                         'assets/icons/ic_gallery.svg',
                         color: Colors.white,
                       ),
                     ),
                   ),
                   title: Text('Music', style: TextStyle(fontWeight: FontWeight.bold),),
                   subtitle: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text('1,432 items . 6.8 GB', style: TextStyle(color: AppColor.gray, fontSize: 12, fontWeight: FontWeight.bold),),
                       SizedBox(
                         width: 100,
                         child: ClipRRect(
                           borderRadius: BorderRadius.all(Radius.circular(10)),
                           child: LinearPercentIndicator(
                             lineHeight: 6,
                             percent: 0.5,
                             backgroundColor: Colors.grey[300],
                             progressColor: AppColor.colorGreen,
                             barRadius: Radius.circular(10),
                             padding: EdgeInsets.zero,
                           ),
                         ),
                       ),
                     ],
                   ),
                 ),
               ),
               SizedBox(height: 40,),
               Container(
                 padding: EdgeInsets.all(8),
                 decoration: BoxDecoration(
                   border: Border.all(
                     color: AppColor.gray,
                     width: 1.0,
                   ),
                   borderRadius: BorderRadius.circular(8), // Slightly rounded corners
                 ),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     RichText(text: TextSpan(
                         children: [
                           TextSpan(text: 'Sending To ', style: TextStyle(color: AppColor.black)),
                           TextSpan(text: 'Android 12.0', style: TextStyle(color: AppColor.colorGreen)),
                           TextSpan(text: '?', style: TextStyle(color: AppColor.black)),
                         ]
                     )),
                     InkWell(
                         onTap: () {},
                         child: Text('cancel', style: TextStyle(color: AppColor.colorRed, fontWeight: FontWeight.bold),)),
                   ],
                 ),
               ),
             ],
           ),
         ),
       );
     }),
    );
  }
}
