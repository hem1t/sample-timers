import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:timers/color.dart';
import 'package:timers/providers.dart';

const Duration animDur = Duration(milliseconds: 170);
const Curve animCurv = Curves.decelerate;

pixel(double p) {
  return Get.pixelRatio * p;
}

const List<Effect> anim = <Effect>[
  ScaleEffect(duration: animDur, curve: animCurv),
  SlideEffect(duration: animDur, curve: animCurv),
];

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    final double sideBar =
        context.select((SideBarControl a) => a.isSidebarOpen) ? 1 : 0;
    final SizedBox gap = SizedBox(height: 30.h);

    return ClipRect(
      child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 1.8, sigmaY: 1.8),
          child: Container(
              height: Get.height,
              width: Get.width,
              padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 20.w),
              color: AppColors.backgroundColor.withOpacity(0.18),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SidebarHead(),
                  gap,
                  const SidebarTimerList(),
                  gap,
                  const SidebarExit(),
                ],
              ))),
    )
        .animate(target: sideBar, effects: anim)
        .slideX(duration: animDur, delay: 70.ms);
  }
}

class SidebarTimerList extends StatelessWidget {
  const SidebarTimerList({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.start,
      children: [
        SidebarButton(
            height: 25.h,
            width: 86.w,
            onPressed: context.read<WhatTimer>().toHome,
            label: "Home"),
        SidebarButton(
            height: 25.h,
            width: 100.w,
            onPressed: context.read<WhatTimer>().toPomodoro,
            label: "Pomodoro"),
        SidebarButton(
            height: 25.h,
            width: 56.w,
            onPressed: context.read<WhatTimer>().toChimes,
            label: "Chimes"),
        SidebarButton(
            height: 25.h,
            width: 70.w,
            onPressed: context.read<WhatTimer>().toPomodoro,
            label: "Pomodoro"),
        SidebarButton(
            height: 25.h,
            width: 86.w,
            onPressed: context.read<WhatTimer>().toHome,
            label: "Chimes"),
        SidebarButton(
            height: 25.h,
            width: 100.w,
            onPressed: context.read<WhatTimer>().toPomodoro,
            label: "Pomodoro"),
        SidebarButton(
            height: 25.h,
            width: 86.w,
            onPressed: context.read<WhatTimer>().toHome,
            label: "Chimes"),
        SidebarButton(
            height: 25.h,
            width: 100.w,
            onPressed: context.read<WhatTimer>().toPomodoro,
            label: "Pomodoro"),
      ],
    );
  }
}

class SidebarHead extends StatelessWidget {
  const SidebarHead({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SidebarButton(
          height: 40.h,
          width: .42.sw,
          fontSize: 22.sp,
          onPressed: context.read<WhatTimer>().toPomodoro,
          label: "Home",
        ),
        SidebarButton(
          height: 40.h,
          width: .42.sw,
          fontSize: 22.sp,
          onPressed: context.read<WhatTimer>().toHome,
          label: "Settings",
        )
      ],
    );
  }
}

class SidebarExit extends StatelessWidget {
  const SidebarExit({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        child: TextButton(
          onPressed: context.read<SideBarControl>().exitSidebar,
          style: TextButton.styleFrom(
            backgroundColor: AppColors.sideHighlight,
            foregroundColor: AppColors.mainHighlight,
            shape: const CircleBorder(),
          ),
          child: Transform.rotate(
              angle: .75,
              child: Icon(
                Icons.add,
                size: 30.r,
              )),
        ));
  }
}

class SidebarButton extends StatelessWidget {
  final double height;
  final double width;
  final String? label;
  final Icon? icon;
  final void Function() onPressed;
  final double? fontSize;
  const SidebarButton(
      {super.key,
      required this.height,
      required this.width,
      this.icon,
      this.label,
      required this.onPressed,
      this.fontSize})
      : super();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        fixedSize: Size(width, height),
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 3.r,
            color: AppColors.hiddenHighlight,
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
      child: Row(
        mainAxisAlignment: icon != null && label != null
            ? MainAxisAlignment.spaceEvenly
            : MainAxisAlignment.center,
        children: [
          icon ?? Container(),
          Text(
            label ?? "",
            style: TextStyle(
                color: AppColors.contrastColor,
                fontWeight: FontWeight.bold,
                fontSize: fontSize),
          ),
        ],
      ),
    ).marginAll(5.r);
  }
}
