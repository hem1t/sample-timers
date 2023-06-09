// ignore_for_file: non_constant_identifier_names

import 'package:flutter_screenutil/flutter_screenutil.dart';

double Rmax(double l) {
  return l.r <= l ? l.r : l;
}

double Hmax(double l) {
  return l.h <= l ? l.h : l;
}

double Wmax(double l) {
  return l.w <= l ? l.w : l;
}

double Rmin(double l) {
  return l.r >= l ? l.r : l;
}

double Hmin(double l) {
  return l.h >= l ? l.h : l;
}

double Wmin(double l) {
  return l.w >= l ? l.w : l;
}

// TODO: Think Later
// R Min and Max;
// double Rmm(double M, double m, double l) {
//   return max(min(m.r, l.r), M.r);
// }

// double Hmm(double l) {
//   return l.r <= l ? l.r : l;
// }

// double Wmm(double l) {
//   return l.r <= l ? l.r : l;
// }
