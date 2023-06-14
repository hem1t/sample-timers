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
    Duration time =
        context.watch<CounterFieldController>().current ?? 0.seconds;
    int state = context.watch<CounterFieldController>().state;
    final style = TextStyle(
      fontSize: 65.sp,
      fontWeight: FontWeight.bold,
      color: state == 0 ? AppColors.contrastColor : AppColors.mainHighlight,
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
  int stepSecs = 1;
  int state = 0;

  prepare(Duration time, Duration endTime, int stepSecs) {
    this.time = time;
    this.endTime = endTime;
    this.stepSecs = stepSecs;
    notifyListeners();
    debugPrint("$time, $endTime, $stepSecs");
  }

  start() {
    current = time;
    state = 1;
    timer = Timer.periodic(stepSecs.abs().seconds, (_) {
      if (current?.inSeconds == endTime?.inSeconds) {
        timer?.cancel();
        state = 0;
        notifyListeners();
      } else {
        current = (current ?? 0.seconds) + stepSecs.seconds;
        notifyListeners();
        debugPrint("$current");
      }
    });
    notifyListeners();
  }

  pause() {
    state = 0;
    timer?.cancel();
    notifyListeners();
  }

  resume() {
    state = 1;
    timer = Timer.periodic(stepSecs.abs().seconds, (_) {
      if (current?.inSeconds == endTime?.inSeconds) {
        notifyListeners();
        timer?.cancel();
      } else {
        current = (current ?? 0.seconds) + stepSecs.seconds;
        notifyListeners();
        debugPrint("$current");
      }
    });
    notifyListeners();
  }

  reset() {
    state = 0;
    current = time;
    timer?.cancel();
    notifyListeners();
  }
}
