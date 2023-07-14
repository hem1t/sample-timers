import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:timers/color.dart';
import 'package:timers/tools/extensions.dart';
import 'package:timers/tools/mm.dart';

class TimeField extends StatefulWidget {
  final String label;
  final void Function(Duration) onTimeSelect;
  final double height;
  final double width;
  final double textSize;
  final Axis direction;
  final Duration current;
  const TimeField(this.label,
      {super.key,
      required this.onTimeSelect,
      required this.height,
      required this.width,
      required this.textSize,
      required this.direction,
      required this.current});

  @override
  State<TimeField> createState() => _TimeFieldState();
}

class _TimeFieldState extends State<TimeField> {
  Duration? pickerTime;
  @override
  void initState() {
    super.initState();
    pickerTime = widget.current;
  }

  textS(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: widget.textSize.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.contrastColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _timeFieldDialog(context);
      },
      child: Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(width: Rmin(2), color: AppColors.mainHighlight)),
        child: Flex(
          direction: widget.direction,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            textS(widget.label),
            textS(
              pickerTime!.toText
            )
          ],
        ).paddingSymmetric(horizontal: Wmin(17)),
      ),
    );
  }

  Future<void> _timeFieldDialog(BuildContext ctx) {
    return showDialog<void>(
        barrierDismissible: false,
        context: ctx,
        builder: (BuildContext ctx) {
          return AlertDialog(
            content: TimePickerSpinner(
              time: pickerTime ?? 0.seconds,
              onTimeChange: (time) {
                setState(() {
                  pickerTime = time;
                });
                pickerTime = time;
              },
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    widget.onTimeSelect(pickerTime ?? 0.seconds);
                    Navigator.of(ctx).pop();
                  },
                  child: const Text("Done"))
            ],
          );
        });
  }
}

class TimePickerSpinner extends StatefulWidget {
  final Duration time;
  final void Function(Duration) onTimeChange;
  const TimePickerSpinner(
      {super.key, required this.time, required this.onTimeChange});

  @override
  State<TimePickerSpinner> createState() => _TimePickerSpinnerState();
}

class _TimePickerSpinnerState extends State<TimePickerSpinner> {
  int hours = 0;
  int minutes = 0;
  int seconds = 0;

  @override
  void initState() {
    super.initState();
    int time = widget.time.inSeconds;
    seconds = time % 60;
    time = time ~/ 60;
    minutes = time % 60;
    time = time ~/ 60;
    hours = time;
  }

  sText(String s) {
    return Text(s,
        style: TextStyle(color: AppColors.hiddenHighlight, fontSize: 20.sp));
  }

  getDur() {
    return Duration(hours: hours, minutes: minutes, seconds: seconds);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TimeSpinner(
            size: 24,
            onPageChanged: (count) {
              setState(() {
                hours = count;
              });
              widget.onTimeChange(getDur());
            },
            current: hours),
        sText(":"),
        TimeSpinner(
            size: 60,
            onPageChanged: (count) {
              setState(() {
                minutes = count;
              });
              widget.onTimeChange(getDur());
            },
            current: minutes),
        sText(":"),
        TimeSpinner(
            size: 60,
            onPageChanged: (count) {
              setState(() {
                seconds = count;
              });
              widget.onTimeChange(getDur());
            },
            current: seconds),
      ],
    );
  }
}

class TimeSpinner extends StatelessWidget {
  final void Function(int) onPageChanged;
  final int current;
  final int size;
  final Axis? scrollDirection;
  const TimeSpinner(
      {super.key,
      required this.onPageChanged,
      required this.current,
      required this.size,
      this.scrollDirection});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      width: 50.w,
      child: PageView.builder(
        controller:
            PageController(viewportFraction: 0.35, initialPage: current),
        pageSnapping: true,
        scrollDirection: scrollDirection ?? Axis.vertical,
        itemCount: size + 1,
        itemBuilder: (ctx, count) {
          return Center(
            child: SizedBox(
              height: 20.h,
              width: 35.w,
              child: AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 90),
                style: TextStyle(
                    fontWeight:
                        count == current ? FontWeight.w500 : FontWeight.w300,
                    fontSize: count == current ? 30.sp : 27.sp,
                    color: count == current
                        ? AppColors.mainHighlight
                        : AppColors.contrastColor),
                child: Text(
                  count.toString(),
                ),
              ),
            ),
          );
        },
        onPageChanged: onPageChanged,
      ),
    );
  }
}
