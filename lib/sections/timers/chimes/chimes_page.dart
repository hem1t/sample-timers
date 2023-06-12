import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:timers/color.dart';
import 'package:timers/layout_widgets/buttons.dart';
import 'package:timers/layout_widgets/fields.dart';
import 'package:timers/tools/mm.dart';

class ChimesPage extends StatelessWidget {
  const ChimesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: .90.sw,
        alignment: Alignment.center,
        color: AppColors.backgroundColor.withOpacity(0.3),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CountDownField().marginOnly(top: 34.h),
            const Column(
              children: [
                TimeField("Time:"),
                TimeField("Chime:"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FilledTextButton(height: 35.h, width: 131.w, onPressed: ()=> {}, label: "Reset", fontSize: 30.r,),
                FilledTextButton(height: 35.h, width: 131.w, onPressed: ()=> {}, label: "Start", fontSize: 30.r,)
              ],
            )
          ],
        ).paddingSymmetric(vertical: 53.h));
  }
}

class TimeField extends StatefulWidget {
  final String label;
  const TimeField(this.label, {super.key});

  @override
  State<TimeField> createState() => _TimeFieldState();
}

class _TimeFieldState extends State<TimeField> {
  int hour = 0;
  int minute = 0;
  int seconds = 0;

  textS(String text) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 25.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.mainHighlight,
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String timeString =
        Duration(hours: hour, minutes: minute, seconds: seconds).toString();
    return Container(
      height: 45.h,
      width: .88.sw,
      decoration: BoxDecoration(
        
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          textS(widget.label),
          textS(
            timeString.substring(0, timeString.indexOf('.')),
          )
        ],
      ).paddingSymmetric(horizontal: Wmin(17)),
    );
  }
}
