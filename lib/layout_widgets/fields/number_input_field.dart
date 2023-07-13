import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timers/color.dart';
import 'package:timers/tools/mm.dart';

class NumberField extends StatefulWidget {
  final double height;
  final double width;
  final String context;
  final void Function(int) onSelect;
  final int? current;
  const NumberField(
      {super.key,
      required this.height,
      required this.width,
      required this.onSelect,
      required this.context,
      this.current});

  @override
  State<NumberField> createState() => _NumberFieldState();
}

class _NumberFieldState extends State<NumberField> {
  int current = 0;

  @override
  void initState() {
    super.initState();
    current = widget.current != null? widget.current! - 1: 0;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _selectDialog(context);
      },
      child: Container(
        height: widget.height,
        width: widget.width,
        margin: EdgeInsets.all(.03.sw),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Rmin(10)),
            border: Border.all(width: Rmin(2))),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Text(
            (current + 1).toString().padLeft(2, '0'),
            style: GoogleFonts.spaceMono(
                fontSize: 22.sp, color: AppColors.contrastColor),
          ),
          Text(
            widget.context,
            style: GoogleFonts.spaceMono(fontSize: 13.sp),
          ),
        ]),
      ),
    );
  }

  Future<void> _selectDialog(BuildContext ctx) {
    return showDialog<void>(
      barrierDismissible: false,
      context: ctx,
      builder: (BuildContext ctx) => AlertDialog(
        content: NumberSpinner(
            onPageChanged: (count) {
              setState(() {
                current = count;
              });
            },
            current: current,
            size: 60),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
                widget.onSelect(current + 1);
              },
              child: const Text("Done"))
        ],
      ),
    );
  }
}

class NumberSpinner extends StatefulWidget {
  final void Function(int) onPageChanged;
  final int current;
  final int size;
  final Axis? scrollDirection;
  const NumberSpinner(
      {super.key,
      required this.onPageChanged,
      required this.current,
      required this.size,
      this.scrollDirection});

  @override
  State<NumberSpinner> createState() => _NumberSpinnerState();
}

class _NumberSpinnerState extends State<NumberSpinner> {
  int current = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    current = widget.current;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      width: .8.sw,
      child: PageView.builder(
          controller: PageController(
              viewportFraction: 0.35, initialPage: widget.current),
          pageSnapping: true,
          scrollDirection: widget.scrollDirection ?? Axis.vertical,
          itemCount: widget.size,
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
                    (count + 1).toString().padLeft(2, '0'),
                  ),
                ),
              ),
            );
          },
          onPageChanged: (count) {
            widget.onPageChanged(count);
            setState(() {
              current = count;
            });
          }),
    );
  }
}
