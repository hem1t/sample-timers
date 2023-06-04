
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timers/color.dart';
import 'package:timers/providers.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
      return Container(
        alignment: Alignment.center,
          color: AppColors.backgroundColor.withOpacity(0.3),
          child: TextButton(
        autofocus: true,
        onPressed: () => {context.read<AppSettings>().gotoSidebar()},
        child: const Text("Go to Sidebar"),
      ));
  }
}
