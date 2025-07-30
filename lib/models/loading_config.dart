import 'package:flutter/material.dart';
import '../core/alert_theme.dart';

class LoadingConfig {
  final String? message;
  final Color? indicatorColor;
  final AlertTheme? theme;

  const LoadingConfig({
    this.message,
    this.indicatorColor,
    this.theme,
  });
}
