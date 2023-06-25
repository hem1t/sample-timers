import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:timers/color.dart';
import 'package:timers/layout_widgets/fields/number_input_field.dart';
import 'package:timers/sections/timers/timer_base.dart';

import 'pomostatus.dart';

enum PomoStatus { work, rest, longrest, idle }

class PomodoroController extends ChangeNotifier {
  Duration passedtime = 0.seconds;
  Duration worktime = 5.seconds;
  Duration resttime = 3.seconds;
  Duration longresttime = 7.seconds;
  double progressPercent = 1;
  int originalPomoRepeat = 1;
  int pomoRepeat = 1;
  int originalSessionRepeat = 1;
  int sessionRepeat = 1;
  PomoStatus status = PomoStatus.idle;
  TimerState timerState = TimerState.preRunning;
  Timer? timer;

  switchTimerState() {
    switch (timerState) {
      case TimerState.preRunning || TimerState.paused || TimerState.done:
        nextPomoStatus();
        play();
        break;
      case TimerState.running:
        pause();
        break;
    }
  }

  play() {
    timerState = TimerState.running;
    Duration time = 1.seconds;
    timer = Timer.periodic(time, (t) {
      debugPrint("$timerState $status $passedtime $progressPercent");
      passedtime += time;
      updateProgress();
      if (progressPercent > 1) {
        nextPomoStatus();
        if (status != PomoStatus.idle) {
          debugPrint("While cancel? $status");
          t.cancel();
          play();
        } else {
          pause();
        }
      }
    });
  }

  pause() {
    timerState = TimerState.paused;
    timer?.cancel();
    notifyListeners();
  }

  setStatus(PomoStatus value) {
    status = value;
    notifyListeners();
  }

  // Increase by percent
  updateProgress() {
    switch (status) {
      case PomoStatus.idle:
        progressPercent = 1;
        break;
      case PomoStatus.work:
        progressPercent =
            passedtime.inMilliseconds / worktime.inMilliseconds + .001;
        break;
      case PomoStatus.rest:
        progressPercent =
            passedtime.inMilliseconds / resttime.inMilliseconds + .001;
        break;
      case PomoStatus.longrest:
        progressPercent =
            passedtime.inMilliseconds / longresttime.inMilliseconds + .001;
        break;
    }
    notifyListeners();
  }

  nextPomoStatus() {
    switch (status) {
      case PomoStatus.work:
        if (sessionRepeat > 1) {
          status = PomoStatus.rest;
        }
        // isLastSession = sessionRepeat == 1;
        else if (sessionRepeat == 1 && pomoRepeat > 1) {
          status = PomoStatus.longrest;
        } else if (sessionRepeat == 1 && pomoRepeat == 1) {
          status = PomoStatus.idle;
        } 
        sessionRepeat -= 1;
        passedtime = 0.seconds;
        break;
      case PomoStatus.rest || PomoStatus.longrest || PomoStatus.idle:
        if (status == PomoStatus.longrest) {
          pomoRepeat -= 1;
          sessionRepeat = originalSessionRepeat;
        }
        if (status == PomoStatus.idle) {
          pomoRepeat = originalPomoRepeat;
          sessionRepeat = originalSessionRepeat;
        }
        status = PomoStatus.work;
        passedtime = 0.seconds;
        break;
    }
    notifyListeners();
  }
}

class PomodoroPage extends StatelessWidget {
  const PomodoroPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pomoRead = context.read<PomodoroController>();

    debugPrint("building pomo!");
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        PomodoroStatus(
          onTap: () {
            // Like, play/pause button.
            pomoRead.switchTimerState();
          },
          size: 170,
          color: AppColors.contrastColor,
        ),
        Wrap(
          alignment: WrapAlignment.center,
          children: [
            NumberField(
              height: .245.sw,
              width: .245.sw,
              context: "work",
              onSelect: (time) {
                debugPrint("Setting pomoWork to: $time");
                pomoRead.worktime = time.minutes;
              },
            ),
            NumberField(
              height: .245.sw,
              width: .245.sw,
              context: "rest",
              onSelect: (time) {
                debugPrint("Setting pomoRest to: $time");
                pomoRead.resttime = time.minutes;
              },
            ),
            NumberField(
              height: .245.sw,
              width: .245.sw,
              context: "long",
              onSelect: (time) {
                debugPrint("Setting pomoLong to: $time");
                pomoRead.longresttime = time.minutes;
              },
            ),
            NumberField(
              height: .245.sw,
              width: .4.sw,
              context: "pomodoros",
              onSelect: (n) {
                debugPrint("Setting pomodoros to: $n");
                pomoRead.pomoRepeat = n;
                pomoRead.originalPomoRepeat = n;
              },
            ),
            NumberField(
              height: .245.sw,
              width: .4.sw,
              context: "sessions",
              onSelect: (n) {
                debugPrint("Setting sessions to: $n");
                pomoRead.sessionRepeat = n;
                pomoRead.originalSessionRepeat = n;
              },
            ),
          ],
        ),
      ],
    );
  }
}
