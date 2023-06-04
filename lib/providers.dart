import 'package:flutter/material.dart';

class AppSettings extends ChangeNotifier {
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
