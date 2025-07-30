import 'package:flutter/material.dart';
import '../enums/alert_type.dart';
import '../core/alert_theme.dart';

class ToastConfig {
  final AlertType type;
  final String message;
  final Duration duration;
  final AlertTheme? theme;

  const ToastConfig({
    required this.type,
    required this.message,
    this.duration = const Duration(seconds: 2),
    this.theme,
  });
}
