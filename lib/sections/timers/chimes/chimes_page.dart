import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:timers/color.dart';
import 'package:timers/layout_widgets/buttons.dart';
import 'package:timers/layout_widgets/fields.dart';
import 'package:timers/tools/mm.dart';

import '../timer_base.dart';

class ChimesController extends ChangeNotifier {
  TimerState timerState = TimerState.preRunning;
  Duration time = Duration.zero;
  Duration chime = Duration.zero;

  set setTimerState(TimerState state) => timerState = state;
  set setTime(Duration time) => time = time;
  set setChime(Duration chime) => chime = chime;
}

class ChimesPage extends StatelessWidget {
  const ChimesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
            width: .90.sw,
            alignment: Alignment.center,
            color: AppColors.backgroundColor.withOpacity(0.3),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CounterField(),
                Column(
                  children: [
                    const TimeField("Time:"),
                    Gap(10.h),
                    const TimeField("Chime:"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FilledTextButton(
                      height: 35.h,
                      width: 131.w,
                      onPressed: () => {},
                      label: "Reset",
                      fontSize: 30.r,
                    ),
                    FilledTextButton(
                      height: 35.h,
                      width: 131.w,
                      onPressed: () {
                        context
                            .read<CounterFieldController>()
                            .prepare(1.minutes, 0.minutes, -1);
                        context.read<CounterFieldController>().start();
                      },
                      label: "Start",
                      fontSize: 30.r,
                    )
                  ],
                )
              ],
            ).paddingSymmetric(vertical: 53.h))
        .marginOnly(top: 50.h);
  }
}

class TimeField extends StatefulWidget {
  final String label;
  const TimeField(this.label, {super.key});

  @override
  State<TimeField> createState() => _TimeFieldState();
}

class _TimeFieldState extends State<TimeField> {
  int hour = 0;
  int minute = 0;
  int seconds = 0;

  textS(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 30.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.contrastColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String timeString =
        Duration(hours: hour, minutes: minute, seconds: seconds).toString();
    return Container(
      height: 45.h,
      width: .88.sw,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(width: Rmin(2), color: AppColors.mainHighlight)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          textS(widget.label),
          textS(
            timeString.substring(0, timeString.indexOf('.')),
          )
        ],
      ).paddingSymmetric(horizontal: Wmin(17)),
    );
  }

  // TODO
  Future<void> _timeFieldDialog(BuildContext ctx) {
    return showDialog<void>(
        context: ctx,
        builder: (BuildContext ctx) {
          return AlertDialog();
        });
  }
}
