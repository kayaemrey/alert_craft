import 'package:flutter/material.dart';
import '../core/alert_theme.dart';

class CustomConfig {
  final Widget child;
  final AlertTheme? theme;

  const CustomConfig({required this.child, this.theme});
}
