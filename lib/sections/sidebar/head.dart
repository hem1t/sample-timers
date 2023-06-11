import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:timers/color.dart';

class SidebarHead extends StatelessWidget {
  const SidebarHead({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: TabBar(
          indicatorColor: AppColors.mainHighlight,
          tabs: [
            Icon(
              Icons.home,
              color: AppColors.contrastColor,
              size: 40.r,
            ).paddingAll(10),
            Icon(
              Icons.settings,
              color: AppColors.contrastColor,
              size: 40.r,
            ).paddingAll(10),
          ],
        ));
  }
}
