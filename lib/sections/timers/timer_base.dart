import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:timers/color.dart';
import 'package:timers/providers.dart';

import 'chimes/chimes_page.dart';
import 'pomodoro/pomodoro_page.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(child: context.watch<WhatTimer>().page),
        Container(
            height: 40.h,
            width: .95.sw,
            alignment: Alignment.centerLeft,
            child: TextButton(
                onPressed: context.read<SideBarControl>().gotoSidebar,
                child: Icon(Icons.coronavirus, size: 35.r,))),
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
    return const PomodoroPage();
  }
}

class ChimesTimerPage extends StatelessWidget {
  const ChimesTimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ChimesPage();
  }
}
