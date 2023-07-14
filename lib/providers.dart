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
  StatelessWidget page = const PresetsPage();

  toPresets() {
    page = const PresetsPage();
    debugPrint("Set Timer to Home!");
    notifyListeners();
  }

  toPomodoro(List<int> vals) {
    page = PomodoroTimerPage(vals: vals);
    debugPrint("Set Timer to POMODORO!");
    notifyListeners();
  }

  toChimes(List<int> vals) {
    page = ChimesTimerPage(vals: vals);
    debugPrint("Set Timer to CHIMES!");
    notifyListeners();
  }
}
