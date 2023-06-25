import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:timers/layout_widgets/buttons.dart';
import 'package:timers/providers.dart';

class SidebarTimerList extends StatelessWidget {
  const SidebarTimerList({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.start,
      crossAxisAlignment: WrapCrossAlignment.start,
      children: [
        ClearTextButton(
            height: 35.h,
            width: 162.w,
            onPressed: context.read<WhatTimer>().toHome,
            fontSize: 26.sp,
            label: "Presets"),
          SizedBox(width: .4.sw),
        ClearTextButton(
            height: 35.h,
            width: 155.w,
            onPressed: context.read<WhatTimer>().toChimes,
            fontSize: 26.sp,
            label: "Chimes"),
        ClearTextButton(
            height: 35.h,
            width: 212.w,
            onPressed: context.read<WhatTimer>().toPomodoro,
            fontSize: 26.sp,
            label: "Pomodoro"),
      ],
    );
  }
}
