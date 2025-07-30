import 'package:flutter/material.dart';
import '../models/custom_config.dart';
import '../core/alert_theme.dart';

class CustomDialogWidget extends StatelessWidget {
  final CustomConfig config;

  const CustomDialogWidget({super.key, required this.config});

  @override
  Widget build(BuildContext context) {
    final theme = config.theme ?? AlertTheme.defaultTheme;
    return Material(
      color: Colors.black.withOpacity(0.5),
      child: Center(
        child: AnimatedContainer(
          duration: theme.animationDuration ?? const Duration(milliseconds: 350),
          decoration: BoxDecoration(
            color: theme.backgroundColor,
            borderRadius: theme.borderRadius,
            boxShadow: theme.shadow,
          ),
          child: config.child,
        ),
      ),
    );
  }
}
