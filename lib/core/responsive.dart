import 'package:flutter/material.dart';

class Responsive {
  final BuildContext context;
  Responsive(this.context);

  Size get size => MediaQuery.of(context).size;
  double wp(double percent) => size.width * percent / 100;
  double hp(double percent) => size.height * percent / 100;
}

extension ResponsiveExt on BuildContext {
  Responsive get responsive => Responsive(this);
}
