import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:timers/color.dart';
import 'package:timers/layout_widgets/fields/counter_field.dart';
import 'package:timers/providers.dart';
import 'package:timers/tools/mm.dart';

import 'chimes/chimes_page.dart';
import 'pomodoro/pomodoro_page.dart';

enum TimerState {
  preRunning,
  paused,
  running,
  done,
}

Widget verticalStick(double width) {
  return SizedBox(
    height: 3,
    width: width,
    child: DecoratedBox(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: AppColors.mainHighlight),
    ),
  );
}

class TimerPage extends StatelessWidget {
  const TimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(child: context.watch<WhatTimer>().page),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
                onPressed: context.read<SideBarControl>().gotoSidebar,
                style: TextButton.styleFrom(),
                child: SizedBox(
                  height: 38.r,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                          3, (i) => verticalStick(25))),
                )),
            TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(),
                child: Icon(
                  Icons.add,
                  color: AppColors.mainHighlight,
                  size: 40.r,
                ))
          ],
        ).marginSymmetric(horizontal: 7.w).marginOnly(top: 5.h)
      ],
    );
  }
}

class HomeTimerPage extends StatelessWidget {
  const HomeTimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        color: AppColors.backgroundColor.withOpacity(0.3),
        child: TextButton(
          autofocus: true,
          onPressed: () => {context.read<SideBarControl>().gotoSidebar()},
          child: const Text("Go to Sidebar"),
        ));
  }
}

class PomodoroTimerPage extends StatelessWidget {
  const PomodoroTimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => PomodoroController(), child: const PomodoroPage());
  }
}

class ChimesTimerPage extends StatelessWidget {
  const ChimesTimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => CounterFieldController()),
      ChangeNotifierProvider(create: (_) => ChimesController()),
    ], child: const ChimesPage());
  }
}
