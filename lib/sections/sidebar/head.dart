import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:timers/layout_widgets/buttons.dart';
import 'package:timers/providers.dart';

class SidebarHead extends StatelessWidget {
  const SidebarHead({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClearTextButton(
          height: 40.h,
          width: .42.sw,
          fontSize: 22.sp,
          onPressed: context.read<WhatTimer>().toPomodoro,
          label: "Home",
        ),
        ClearTextButton(
          height: 40.h,
          width: .42.sw,
          fontSize: 22.sp,
          onPressed: context.read<WhatTimer>().toHome,
          label: "Settings",
        )
      ],
    );
  }
}
