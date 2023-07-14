import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:timers/color.dart';
import 'package:timers/db/entities/presets.dart';
import 'package:timers/db/isar_services.dart';
import 'package:timers/providers.dart';
import 'package:timers/tools/extensions.dart';
import 'package:timers/tools/mm.dart';

class PresetView extends StatelessWidget {
  final Presets preset;

  const PresetView({super.key, required this.preset});

  @override
  Widget build(BuildContext context) {
    final presetName = preset.presetName;
    final timerCode = preset.timerCode;
    final vals = preset.timerVals;
    final presetNameTextStyle = GoogleFonts.spaceMono(
        textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp));
    return Container(
      margin: EdgeInsets.symmetric(vertical: Rmin(5), horizontal: Rmin(10)),
      width: .9.sw,
      height: 70.h,
      padding: EdgeInsets.symmetric(horizontal: Rmin(10)),
      decoration: BoxDecoration(
          border: Border.all(width: Rmin(2), color: Colors.blue),
          borderRadius: BorderRadius.circular(Rmin(15))),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                presetName,
                style: presetNameTextStyle,
              ),
              TimerCodeTag(name: timerCode).marginOnly(left: Rmin(10)),
              const Spacer(),
              TextButton(
                  onPressed: () {
                    context.read<IsarService>().deletePresets(preset.id);
                  },
                  child: const Icon(Icons.delete)),
            ],
          ),
          Row(
            children: [
              ...timerValsListView(timerCode, vals),
              const Spacer(),
              LoadButton(preset: preset)
            ],
          )
        ],
      ),
    );
  }
}

List<Widget> timerValsListView(TimerCode timerCode, List<int> vals) {
  var decoration = BoxDecoration(
    border: Border.all(width: Rmin(2), color: AppColors.contrastColor),
    borderRadius: BorderRadius.circular(Rmin(7)),
  );
  return List.generate(vals.length, (index) {
    switch (timerCode) {
      case TimerCode.pomo:
        return Container(
          height: Rmin(30),
          width: Rmin(30),
          margin: EdgeInsets.all(Rmin(2)),
          decoration: decoration,
          alignment: Alignment.center,
          child: Text(vals[index].toString()),
        );
      case TimerCode.chime:
        var dur = vals[index].seconds;
        return Container(
          height: Rmin(30),
          width: Rmin(100),
          margin: EdgeInsets.all(Rmin(2)),
          decoration: decoration,
          alignment: Alignment.center,
          child: Text(dur.toText),
        );
    }
  });
}

class TimerCodeTag extends StatelessWidget {
  final TimerCode name;
  const TimerCodeTag({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    var name = this.name.toString().substring(10);
    return Container(
        width: Rmin(name.length * 12),
        height: 18.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Rmin(12)), color: Colors.blue),
        child: Text(
          name,
          style: GoogleFonts.spaceMono(color: Colors.white),
        ));
  }
}

class LoadButton extends StatelessWidget {
  final Presets preset;
  const LoadButton({super.key, required this.preset});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        switch (preset.timerCode) {
          case TimerCode.pomo:
            context.read<WhatTimer>().toPomodoro(preset.timerVals);
          case TimerCode.chime:
            context.read<WhatTimer>().toChimes(preset.timerVals);
        }
      },
      style: TextButton.styleFrom(
          backgroundColor: Colors.blue,
          shape: const StadiumBorder(),
          fixedSize: Size(10.h, 20.w)),
      child: Text(
        "Load",
        style: GoogleFonts.spaceMono(color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }
}
