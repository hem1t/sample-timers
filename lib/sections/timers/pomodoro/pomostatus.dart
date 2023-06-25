import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:timers/color.dart';

import '../timer_base.dart';
import 'pomodoro_page.dart';

class PomodoroStatus extends StatelessWidget {
  final void Function()? onTap;
  final double size;
  final Color color;
  const PomodoroStatus(
      {super.key, this.onTap, required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.r,
      width: size.r,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular((size / 2).r),
          border: Border.all(width: size.r * 0.08, color: color)),
      child: Container(
        height: size.r * .7,
        width: size.r * .7,
        alignment: Alignment.center,
        child: Stack(
          children: [
            Center(
              child: CircularProgressIndicator(
                value: context.select<PomodoroController, double>(
                    (ctrl) => ctrl.progressPercent),
                strokeWidth: size.r * .62,
                color: color,
              ),
            ),
            // Button
            Center(
              child: GestureDetector(
                onTap: onTap,
                child: context.select<PomodoroController, TimerState>(
                            (ctrl) => ctrl.timerState) ==
                        TimerState.running
                        ? Icon(Icons.pause_rounded,
                        color: AppColors.sideHighlight, size: size.r * .5)
                    : Icon(Icons.play_arrow_rounded,
                        color: AppColors.sideHighlight, size: size.r * .5),
              ),
            )
          ],
        ),
      ),
    );
  }
}
