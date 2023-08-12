import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:timers/color.dart';
import 'package:timers/db/isar_services.dart';
import 'package:timers/providers.dart';
import 'package:timers/sections/timers/timer_base.dart';

import 'sections/sidebar/sidebar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(384, 554),
        minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'Timers',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primaryColor: AppColors.backgroundColor,
                shadowColor: AppColors.contrastColor),
            home: SafeArea(
              child: Scaffold(
                backgroundColor: AppColors.backgroundColor,
                resizeToAvoidBottomInset: false,
                body: MultiProvider(
                  providers: [
                    ChangeNotifierProvider(create: (_) => SideBarControl()),
                    ChangeNotifierProvider(create: (_) => WhatTimer()),
                    ChangeNotifierProvider(create: (_) => IsarService())
                  ],
                  child: const Timer(),
                ),
              ),
            ),
          );
        });
  }
}

class Timer extends StatelessWidget {
  const Timer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: const TimerPage()),
        const Sidebar(),
      ],
    );
  }
}
