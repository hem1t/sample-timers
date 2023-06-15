import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:timers/color.dart';
import 'package:timers/layout_widgets/buttons.dart';
import 'package:timers/layout_widgets/fields/counter_field.dart';
import 'package:timers/layout_widgets/fields/time_input_field.dart';

import '../timer_base.dart';

class ChimesController extends ChangeNotifier {
  TimerState timerState = TimerState.preRunning;
  Duration time = Duration.zero;
  Duration chime = Duration.zero;

  set setTimerState(TimerState state) => timerState = state;
  set setTime(Duration time) => time = time;
  set setChime(Duration chime) => chime = chime;

  String chimeButtonLabel() {
    switch (timerState) {
      case TimerState.preRunning:
        return "Start";
      case TimerState.paused:
        return "Resume";
      case TimerState.running:
        return "Pause";
      case TimerState.done:
        return "Start";
    }
  }

  chimeOnPressed(CounterFieldController counterField) {
    switch (timerState) {
      case TimerState.preRunning:
        if (time > 0.seconds) {
          counterField.prepare(0.seconds, time, 1);
          timerState = TimerState.running;
          counterField.start();
        }
        break;
      case TimerState.running:
        counterField.pause();
        timerState = TimerState.paused;
        break;
      case TimerState.paused:
        counterField.resume();
        timerState = TimerState.running;
        break;
      case TimerState.done:
        break;
    }
    notifyListeners();
  }

  chimeComplete() {
    timerState = TimerState.preRunning;
    notifyListeners();
  }

  chimeReset(CounterFieldController counterField) {
    timerState = TimerState.preRunning;
    counterField.reset();
    notifyListeners();
  }
}

class ChimesPage extends StatelessWidget {
  const ChimesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final chimeController = context.read<ChimesController>();
    final counterField = context.read<CounterFieldController>();
    final player = AudioPlayer();
    final chimeSound = AssetSource("chime.mp3");
    final chimeEndSound = AssetSource("chimeEnd.mp3");
    return Container(
            width: .90.sw,
            alignment: Alignment.center,
            color: AppColors.backgroundColor.withOpacity(0.3),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CounterField(
                  onTick: (time) async {
                    var chimeTime = chimeController.chime.inSeconds;
                    var chimeTimeminusOne = chimeTime - 1;
                    if (time >= chimeController.chime - 1.seconds &&
                        time.inSeconds % chimeTime == chimeTimeminusOne &&
                        chimeController.chime != 0.seconds &&
                        time != chimeController.time - 1.seconds) {
                      await player.play(chimeSound);
                    }
                  },
                  onEnd: () async {
                    chimeController.chimeComplete();
                    await player.play(chimeEndSound);
                  },
                ),
                Column(
                  children: [
                    TimeField(
                      "Time:",
                      onTimeSelect: (time) {
                        chimeController.time = time;
                      },
                    ),
                    Gap(10.h),
                    TimeField(
                      "Chime:",
                      onTimeSelect: (time) {
                        chimeController.chime = time;
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FilledTextButton(
                      height: 35.h,
                      width: 131.w,
                      onPressed: () {
                        chimeController.chimeReset(counterField);
                      },
                      label: "Reset",
                      fontSize: 30.r,
                    ),
                    FilledTextButton(
                      height: 35.h,
                      width: 191.w,
                      onPressed: () {
                        chimeController.chimeOnPressed(counterField);
                      },
                      label:
                          context.watch<ChimesController>().chimeButtonLabel(),
                      fontSize: 30.r,
                    )
                  ],
                )
              ],
            ).paddingSymmetric(vertical: 53.h))
        .marginOnly(top: 50.h);
  }
}
