import 'package:flutter/material.dart';

class ScreenUtil {
  static double w(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double h(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}

extension SizeExtension on num {
  double w(BuildContext context) => this * ScreenUtil.w(context) / 100;
  double h(BuildContext context) => this * ScreenUtil.h(context) / 100;
}
