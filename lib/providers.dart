import 'package:flutter/material.dart';
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
  StatelessWidget page = const TimerPage();

  toHome() {
    page = const TimerPage();
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
