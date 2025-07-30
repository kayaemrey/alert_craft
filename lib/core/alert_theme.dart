import 'package:flutter/material.dart';

class AlertTheme {
  // Varsayılan tema (paket teması)
  static AlertTheme defaultTheme = AlertTheme(
    backgroundColor: Colors.white,
    titleStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
    descriptionStyle: const TextStyle(fontSize: 15),
    buttonStyle: ElevatedButton.styleFrom(),
    borderRadius: BorderRadius.circular(16),
    shadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 24,
        offset: Offset(0, 8),
      ),
    ],
    animationDuration: const Duration(milliseconds: 350),
  );

  final Color? backgroundColor;
  final TextStyle? titleStyle;
  final TextStyle? descriptionStyle;
  final ButtonStyle? buttonStyle;
  final BorderRadius? borderRadius;
  final List<BoxShadow>? shadow;
  final Duration? animationDuration;

  const AlertTheme({
    this.backgroundColor,
    this.titleStyle,
    this.descriptionStyle,
    this.buttonStyle,
    this.borderRadius,
    this.shadow,
    this.animationDuration,
  });

  AlertTheme copyWith({
    Color? backgroundColor,
    TextStyle? titleStyle,
    TextStyle? descriptionStyle,
    ButtonStyle? buttonStyle,
    BorderRadius? borderRadius,
    List<BoxShadow>? shadow,
    Duration? animationDuration,
  }) {
    return AlertTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      titleStyle: titleStyle ?? this.titleStyle,
      descriptionStyle: descriptionStyle ?? this.descriptionStyle,
      buttonStyle: buttonStyle ?? this.buttonStyle,
      borderRadius: borderRadius ?? this.borderRadius,
      shadow: shadow ?? this.shadow,
      animationDuration: animationDuration ?? this.animationDuration,
    );
  }
}
