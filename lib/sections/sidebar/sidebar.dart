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

    return ClipRect(
      child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: Container(
              height: Get.height,
              width: Get.width,
              padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 20.w),
              color: AppColors.backgroundColor.withOpacity(0.4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SidebarButton(
                        height: 40.h,
                        width: .42.sw,
                        onPressed: context.read<WhatTimer>().toPomodoro,
                        label: "Home",
                      ),
                      SidebarButton(
                        height: 40.h,
                        width: .42.sw,
                        onPressed: context.read<WhatTimer>().toHome,
                        label: "Settings",
                      )
                    ],
                  ),
                  // Exit
                  Align(
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
                      )),
                ],
              ))),
    )
        .animate(target: sideBar, effects: anim)
        .slideX(duration: animDur, delay: 70.ms);
  }
}

class SidebarButton extends StatelessWidget {
  final double height;
  final double width;
  final String? label;
  final Icon? icon;
  final void Function() onPressed;
  const SidebarButton(
      {super.key,
      required this.height,
      required this.width,
      this.icon,
      this.label,
      required this.onPressed})
      : super();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        minimumSize: Size(width, height),
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
                fontSize: 22.sp),
          ),
        ],
      ),
    ).marginAll(5.r);
  }
}
