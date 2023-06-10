import 'package:flutter/material.dart';
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
            ),
            Icon(
              Icons.settings,
              color: AppColors.contrastColor,
            ),
          ],
        ));
  }
}
