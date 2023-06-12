import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timers/sections/timers/timer_base.dart';

class SideBarControl extends ChangeNotifier {
  bool isSidebarOpen = true;

  gotoSidebar() {
    isSidebarOpen = true;
    debugPrint("entering sidebar");
    notifyListeners();
  }

  exitSidebar() {
    isSidebarOpen = false;
    debugPrint("exiting sidebar");
    notifyListeners();
  }
}

class WhatTimer extends ChangeNotifier {
  StatelessWidget page = const ChimesTimerPage();

  toHome() {
    page = const HomeTimerPage();
    debugPrint("Set Timer to Home!");
    notifyListeners();
  }

  toPomodoro() {
    page = const PomodoroTimerPage();
    debugPrint("Set Timer to POMODORO!");
    notifyListeners();
  }

  toChimes() {
    page = const ChimesTimerPage();
    debugPrint("Set Timer to CHIMES!");
    notifyListeners();
  }
}

class CountDownController extends ChangeNotifier {
  final Duration time;
  CountDownController(this.time);
  int seconds = 0;
  Timer? timer;

  start() {
    seconds = time.inSeconds;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds <= 0) {
        timer.cancel();
      } else {
        seconds--;
        notifyListeners();
      }
    });
  }

  pause() {
    timer?.cancel();
  }

  resume() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds <= 0) {
        timer.cancel();
      } else {
        seconds--;
        notifyListeners();
      }
    });
  }

  reset() {
    seconds = time.inSeconds;
  }
}
