import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:timers/color.dart';

class CounterField extends StatelessWidget {
  const CounterField({super.key});

  @override
  Widget build(BuildContext context) {
    Duration time = context.watch<CounterFieldController>().current ?? 0.seconds;
    final style = TextStyle(
      fontSize: 65.sp,
      fontWeight: FontWeight.bold,
      color:
          time == 0.seconds ? AppColors.contrastColor : AppColors.mainHighlight,
    );

    String tstring = time.toString();
    return Text(
      tstring.substring(0, tstring.indexOf('.')),
      style: style,
    );
  }
}

class CounterFieldController extends ChangeNotifier {
  Duration? time;
  Duration? endTime;
  Duration? current;
  Timer? timer;
  int stepSecs = 0;

  prepare(Duration time, Duration endTime, int stepSecs) {
    this.time = time;
    this.endTime = endTime;
    this.stepSecs = stepSecs;
  }

  start() {
    current = time;
    timer = Timer.periodic(stepSecs.seconds, (timer) {
      if (current?.inSeconds == endTime?.inSeconds) {
        notifyListeners();
        timer.cancel();
      } else {
        current = (current ?? 0.seconds) + stepSecs.seconds;
        notifyListeners();
      }
    });
  }

  pause() {
    timer?.cancel();
  }

  resume() {
    timer = Timer.periodic(stepSecs.seconds, (timer) {
      if (current?.inSeconds == endTime?.inSeconds) {
        notifyListeners();
        timer.cancel();
      } else {
        current = (current ?? 0.seconds) + stepSecs.seconds;
        notifyListeners();
      }
    });
  }

  reset() {
    current = time;
  }
}
