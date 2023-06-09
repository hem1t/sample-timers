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
      children: [
        ClearTextButton(
            height: 25.h,
            width: 86.w,
            onPressed: context.read<WhatTimer>().toHome,
            label: "Home"),
        ClearTextButton(
            height: 25.h,
            width: 100.w,
            onPressed: context.read<WhatTimer>().toPomodoro,
            label: "Pomodoro"),
        ClearTextButton(
            height: 25.h,
            width: 56.w,
            onPressed: context.read<WhatTimer>().toChimes,
            label: "Chimes"),
        ClearTextButton(
            height: 25.h,
            width: 70.w,
            onPressed: context.read<WhatTimer>().toPomodoro,
            label: "Pomodoro"),
        ClearTextButton(
            height: 25.h,
            width: 86.w,
            onPressed: context.read<WhatTimer>().toHome,
            label: "Chimes"),
        ClearTextButton(
            height: 25.h,
            width: 100.w,
            onPressed: context.read<WhatTimer>().toPomodoro,
            label: "Pomodoro"),
        ClearTextButton(
            height: 25.h,
            width: 86.w,
            onPressed: context.read<WhatTimer>().toHome,
            label: "Chimes"),
        ClearTextButton(
            height: 25.h,
            width: 100.w,
            onPressed: context.read<WhatTimer>().toPomodoro,
            label: "Pomodoro"),
      ],
    );
  }
}
