import 'package:flutter/material.dart';
import '../enums/alert_type.dart';
import '../core/alert_theme.dart';

class AlertConfig {
  final AlertType type;
  final String title;
  final String description;
  final String? buttonText;
  final VoidCallback? onPressed;
  final AlertTheme? theme;

  const AlertConfig({
    required this.type,
    required this.title,
    required this.description,
    this.buttonText,
    this.onPressed,
    this.theme,
  });
}
