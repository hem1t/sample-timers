
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timers/color.dart';
import 'package:timers/providers.dart';

import 'pomodoro/pomodoro_page.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({super.key});

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
