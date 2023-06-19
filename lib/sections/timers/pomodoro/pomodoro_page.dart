import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:timers/color.dart';
import 'package:timers/layout_widgets/buttons.dart';
import 'package:timers/layout_widgets/fields/counter_field.dart';
import 'package:timers/layout_widgets/fields/time_input_field.dart';

class PomodoroPage extends StatelessWidget {
  const PomodoroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterFieldController())
      ],
      child: Container(
        height: Get.height,
        width: Get.width,
        alignment: Alignment.center,
        color: AppColors.backgroundColor.withOpacity(0.3),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const PomodoroStatus(
              status: Work(.11),
            ),
            CounterField(),
            Column(
              children: [
                NumberField(height: 40.h, width: 50.w),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TimeField(
                        height: 60.h,
                        width: .4.sw,
                        textSize: 30,
                        direction: Axis.vertical,
                        "Work",
                        onTimeSelect: (time) {}),
                    TimeField(
                        height: 60.h,
                        width: .4.sw,
                        textSize: 30,
                        direction: Axis.vertical,
                        "Rest",
                        onTimeSelect: (time) {}),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FilledTextButton(
                  height: 30.h,
                  width: .3.sw,
                  onPressed: () {},
                  label: "Reset",
                ),
                FilledTextButton(
                  height: 30.h,
                  width: .6.sw,
                  onPressed: () {},
                  label: "Start",
                )
              ],
            ),
          ],
        ).marginOnly(top: 110.h, bottom: 40.h),
      ),
    );
  }
}

class NumberField extends StatelessWidget {
  final double height;
  final double width;
  const NumberField({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height,
        width: width,
        child: PageView.builder(
            itemCount: 50, itemBuilder: (ctx, count) => Text("$count")));
  }
}

class PomoStatus {
  const PomoStatus(this.progress);

  final double progress;
  String get message => "";
  Color? get backgroundColor => Colors.grey;
  Color? get color => null;
}

class Idle extends PomoStatus {
  const Idle() : super(0);

  @override
  String get message => "Idle";
}

class Work extends PomoStatus {
  final double p;
  const Work(this.p) : super(p);

  @override
  String get message => "Idle";
  @override
  Color? get backgroundColor => null;
  @override
  Color? get color => Colors.redAccent;
}

class Rest extends PomoStatus {
  final double p;
  const Rest(this.p) : super(p);

  @override
  String get message => "Idle";
  @override
  Color? get backgroundColor => null;
  @override
  Color? get color => Colors.orangeAccent;
}

class PomodoroStatus extends StatelessWidget {
  final PomoStatus status;
  const PomodoroStatus({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50.r,
        width: 50.r,
        child: Stack(
          children: [
            Center(child: Text(status.message)),
            Center(
              child: CircularProgressIndicator(
                value: status.progress,
                backgroundColor: status.backgroundColor,
                color: status.color,
              ),
            ),
          ],
        ));
  }
}
