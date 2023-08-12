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

// R Min and Max;
double Rmm(double l, {required double min, required double max}) {
  if (l.r <= min) {
    return min;
  }
  if (l.r >= max) {
    return max;
  }
  return l.r;
}

double Hmm(double l, {required double min, required double max}) {
  if (l.h <= min) {
    return min;
  }
  if (l.h >= max) {
    return max;
  }
  return l.h;
}

double Wmm(double l, {required double min, required double max}) {
  if (l.w <= min) {
    return min;
  }
  if (l.w >= max) {
    return max;
  }
  return l.w;
}
