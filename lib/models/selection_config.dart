import 'package:flutter/material.dart';
import '../enums/alert_type.dart';
import '../core/alert_theme.dart';

class SelectionConfig {
  final AlertType type;
  final String title;
  final String description;
  final String leftText;
  final String rightText;
  final VoidCallback? onLeft;
  final VoidCallback? onRight;
  final AlertTheme? theme;

  const SelectionConfig({
    required this.type,
    required this.title,
    required this.description,
    required this.leftText,
    required this.rightText,
    this.onLeft,
    this.onRight,
    this.theme,
  });
}
