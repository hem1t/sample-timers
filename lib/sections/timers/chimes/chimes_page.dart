import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:timers/color.dart';
import 'package:timers/layout_widgets/buttons.dart';
import 'package:timers/tools/mm.dart';

class ChimesPage extends StatelessWidget {
  const ChimesPage({super.key});

  @override
  Widget build(BuildContext context) {
    textS(String text) {
      return Text(
        text,
        style: TextStyle(
            fontSize: 17.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.contrastColor),
      );
    }

    return Container(
        width: .65.sw,
        alignment: Alignment.center,
        color: AppColors.backgroundColor.withOpacity(0.3),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TimeField("Start:"),
            TimeField("Chime:"),
            TimeField("Endat:"),
          ],
        ));
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


  @override
  Widget build(BuildContext context) {
    String timeString = Duration(hours: hour, minutes: minute, seconds: seconds).toString();
    return ClearTextButton(
      height: 25.h,
      width: .65.sw,
      onPressed: () => {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.label),
          Text(
            timeString.substring(0, timeString.indexOf('.')),
          )
        ],
      ).paddingSymmetric(horizontal: Wmin(5)),
    );
  }
}
