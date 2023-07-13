import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:timers/color.dart';
import 'package:timers/db/entities/presets.dart';
import 'package:timers/db/isar_services.dart';
import 'package:timers/layout_widgets/fields/counter_field.dart';
import 'package:timers/providers.dart';

import 'chimes/chimes_page.dart';
import 'pomodoro/pomodoro_page.dart';
import 'presets_view.dart';

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

class TimerHead extends StatelessWidget {
  final void Function(String) onAdd;
  const TimerHead({super.key, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Row(
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
                  children: List.generate(3, (i) => verticalStick(25))),
            )),
        TextButton(
            onPressed: () {
              onAdd("randomName");
            },
            style: TextButton.styleFrom(),
            child: Icon(
              Icons.add,
              color: AppColors.mainHighlight,
              size: 40.r,
            ))
      ],
    ).marginSymmetric(horizontal: 7.w).marginOnly(top: 5.h);
  }
}

class TimerPage extends StatelessWidget {
  const TimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: context.watch<WhatTimer>().page);
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

  onPresetAdd(BuildContext context, String presetName) {
    final chimeRead = context.read<ChimesController>();

    IsarService().savePreset(presetName, TimerCode.chime,
        [chimeRead.time.inSeconds, chimeRead.chime.inSeconds]);
  }
}

class PresetsPage extends StatelessWidget {
  const PresetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TimerHead(
          onAdd: (name) {},
        ),
        StreamBuilder(
            stream: context.read<IsarService>().getPresets(),
            builder: (context, stream) {
              if (stream.hasData) {
                var data = stream.data ?? [];
                return Expanded(
                  child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return PresetView(preset: data[index]);
                      }),
                );
              } else {
                return const Expanded(
                  child: Center(child: Text("No Preset!!!")),
                );
              }
            }),
      ],
    );
  }
}

