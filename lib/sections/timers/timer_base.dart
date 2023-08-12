import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:timers/color.dart';
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

class TimerHead extends StatefulWidget {
  final void Function(String)? onAdd;
  const TimerHead({super.key, this.onAdd});

  @override
  State<TimerHead> createState() => _TimerHeadState();
}

class _TimerHeadState extends State<TimerHead> {
  late TextEditingController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TextEditingController();
    _controller.clearComposing();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

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
        widget.onAdd != null
            ? Expanded(
                child: TextField(
                  autofocus: false,
                  controller: _controller,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                      border: InputBorder.none, hintText: "Name"),
                ),
              )
            : Container(),
        widget.onAdd != null
            ? TextButton(
                onPressed: () {
                  widget.onAdd!(_controller.text);
                },
                style: TextButton.styleFrom(),
                child: Icon(
                  Icons.add,
                  color: AppColors.mainHighlight,
                  size: 40.r,
                ))
            : Container()
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
  final List<int> vals;
  const PomodoroTimerPage({super.key, required this.vals});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => PomodoroController(vals), child: const PomodoroPage());
  }
}

class ChimesTimerPage extends StatelessWidget {
  final List<int> vals;
  const ChimesTimerPage({super.key, required this.vals});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => CounterFieldController()),
      ChangeNotifierProvider(create: (_) => ChimesController(vals)),
    ], child: const ChimesPage());
  }
}

class PresetsPage extends StatelessWidget {
  const PresetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TimerHead(),
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
