// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:starting_todo_app/utils/color.dart';
// import '../../routes/app_routes.dart';
// import '../../utils/constant.dart';
// import '../calender/calenderlogic.dart';
// import 'notificationLogic.dart';
//
// class Notificationview extends StatefulWidget {
//   const Notificationview({super.key});
//
//   @override
//   State<Notificationview> createState() => _NotificationviewState();
// }
//
// class _NotificationviewState extends State<Notificationview> {
//   DateTime? scheduleTime;
//   final Notificationlogic controller = Get.put(Notificationlogic());
//   final CalendarController calenderController = Get.put(CalendarController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GetBuilder<Notificationlogic>(
//         id: Constant.idHome,
//         builder: (logic) {
//           return Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 DatePickerTxt(
//                   onDateTimeSelected: (selectedDate) {
//                     setState(() {
//                       scheduleTime = selectedDate;
//                     });
//                   },
//                 ),
//                 SizedBox(height: 10,),
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     foregroundColor: AppColor.white,
//                     backgroundColor: AppColor.colorGreen,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(60),
//                     ),
//                   ),
//                   onPressed: () {
//                     controller.scheduleNotification(
//                       title: 'Schedule Notification',
//                         body: '$scheduleTime',
//                         scheduleNotificationDateTime: scheduleTime!);
//                   },
//                   child: Text('Schedule Notification'),
//                 ),
//                 SizedBox(height: 30),
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     foregroundColor: AppColor.white,
//                     backgroundColor: AppColor.colorGreen,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(60),
//                     ),
//                   ),
//                   onPressed: () {
//                     Get.offAllNamed(AppRoutes.home);
//                   },
//                   child: Text('Back'),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//
//
