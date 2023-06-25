import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:timers/color.dart';
import 'package:timers/tools/mm.dart';

class ClearTextButton extends StatelessWidget {
  final double height;
  final double width;
  final String? label;
  final Icon? icon;
  final Widget? child;
  final void Function() onPressed;
  final double? fontSize;
  const ClearTextButton(
      {super.key,
      required this.height,
      required this.width,
      this.icon,
      this.label,
      required this.onPressed,
      this.fontSize,
      this.child})
      : super();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        fixedSize: Size(width, height),
        backgroundColor: Colors.transparent,
        padding: EdgeInsets.symmetric(
            vertical: height * 0.1, horizontal: width * 0.1),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: Rmin(3),
            color: AppColors.hiddenHighlight,
          ),
          borderRadius: BorderRadius.circular(15.r),
        ),
      ),
      child: child ??
          Row(
            mainAxisAlignment: icon != null && label != null
                ? MainAxisAlignment.spaceEvenly
                : MainAxisAlignment.center,
            children: [
              icon ?? Container(),
              Text(
                label ?? "",
                style: TextStyle(
                    color: AppColors.contrastColor,
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize),
              ),
            ],
          ),
    ).marginAll(5.r);
  }
}

class FilledTextButton extends StatelessWidget {
  final double height;
  final double width;
  final String? label;
  final Icon? icon;
  final Widget? child;
  final void Function() onPressed;
  final double? fontSize;
  const FilledTextButton(
      {super.key,
      required this.height,
      required this.width,
      this.label,
      this.icon,
      this.child,
      required this.onPressed,
      this.fontSize});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        fixedSize: Size(width, height),
        backgroundColor: AppColors.mainHighlight,
        padding: EdgeInsets.symmetric(
            vertical: height * 0.1, horizontal: width * 0.2),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: Rmin(2),
            color: AppColors.contrastColor,
          ),
          borderRadius: BorderRadius.circular(height * .55),
        ),
      ),
      child: child ??
          Row(
            mainAxisAlignment: icon != null && label != null
                ? MainAxisAlignment.spaceEvenly
                : MainAxisAlignment.center,
            children: [
              icon ?? Container(),
              Text(
                label ?? "",
                style: TextStyle(
                    color: AppColors.backgroundColor,
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize),
              ),
            ],
          ),
    ).marginAll(5.r);
  }
}
