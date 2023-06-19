import 'package:flutter/material.dart';
import 'package:timers/sections/timers/timer_base.dart';

class SideBarControl extends ChangeNotifier {
  bool isSidebarOpen = false;

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
  StatelessWidget page = const PomodoroTimerPage();

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

