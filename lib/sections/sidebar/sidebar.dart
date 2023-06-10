import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:timers/color.dart';
import 'package:timers/providers.dart';

import 'head.dart';
import 'timer_list.dart';

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
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
              height: Get.height,
              width: Get.width,
              padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 20.w),
              color: AppColors.backgroundColor.withOpacity(0.43),
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

