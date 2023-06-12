import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timers/color.dart';

class CountDownField extends StatefulWidget {
  final Duration? time;
  const CountDownField({super.key, this.time});

  @override
  State<CountDownField> createState() => _CountDownFieldState();
}

class _CountDownFieldState extends State<CountDownField> {
  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
        fontSize: 55.sp,
        fontWeight: FontWeight.bold,
        color:
        widget.time == null ? AppColors.contrastColor : AppColors.mainHighlight);

    Duration time =
        widget.time ?? const Duration(hours: 0, minutes: 0, seconds: 0);

    String tstring = time.toString();
    return Text(
      tstring.substring(0, tstring.indexOf('.')),
      style: style,
    );
  }
}
