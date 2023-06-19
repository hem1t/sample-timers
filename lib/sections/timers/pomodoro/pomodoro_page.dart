import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:timers/color.dart';
import 'package:timers/layout_widgets/buttons.dart';
import 'package:timers/layout_widgets/fields/counter_field.dart';
import 'package:timers/layout_widgets/fields/time_input_field.dart';
import 'package:timers/tools/mm.dart';

class PomodoroController extends ChangeNotifier {
  Duration worktime = 0.seconds;
  Duration resttime = 0.seconds;
  int repeat = 0;
  PomoStatus status = const Idle();

  setStatus(PomoStatus value) {
    status = value;
    notifyListeners();
  }
}

class PomodoroPage extends StatelessWidget {
  const PomodoroPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pomodoro = context.read<PomodoroController>();
    return Container(
      height: Get.height,
      width: Get.width,
      alignment: Alignment.center,
      color: AppColors.backgroundColor.withOpacity(0.3),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              PomodoroStatus(
                status: context.watch<PomodoroController>().status,
              ),
              CounterField(
                onTick: (time) {
                  pomodoro.setStatus(Work(pomodoro.status.progress + .1));
                },
              ),
            ],
          ),
          Column(
            children: [
              NumberField(height: 55.h, width: .4.sw),
              Gap(10.h),
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
                width: .36.sw,
                onPressed: () {},
                label: "Reset",
                fontSize: 30.r,
              ),
              FilledTextButton(
                height: 30.h,
                width: .57.sw,
                onPressed: () {
                  context
                      .read<CounterFieldController>()
                      .prepare(0.seconds, 10.seconds, 1);
                  context.read<CounterFieldController>().start();
                },
                label: "Start",
                fontSize: 30.r,
              )
            ],
          ),
        ],
      ).marginOnly(top: 70.h, bottom: 40.h),
    );
  }
}

class NumberField extends StatelessWidget {
  final double height;
  final double width;
  const NumberField({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        border: Border.all(width: Rmin(2)),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Repeat",
              style: TextStyle(
                fontSize: 30.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.contrastColor,
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClearTextButton(height: 10.r, width: 10.r, onPressed: () {},
                label: "<",
              ),
              SizedBox(height: 25.h,
                width: 22,
                child:
              ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, count) {
                    return Text(
                      "$count",
                      style: TextStyle(
                        fontSize: 30.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.contrastColor,
                      ),
                    );
                  }),
              ),
              ClearTextButton(height: 10.r, width: 10.r, onPressed: () {}, label: ">",),
            ],
          ),
        ],
      ),
    );
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
  String get message => "Work";
  @override
  Color? get backgroundColor => null;
  @override
  Color? get color => Colors.redAccent;
}

class Rest extends PomoStatus {
  final double p;
  const Rest(this.p) : super(p);

  @override
  String get message => "Rest";
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
