import 'package:flutter/material.dart';
import '../models/alert_config.dart';
import '../core/responsive.dart';
import '../core/alert_theme.dart';
import '../enums/alert_type.dart';
import '../overlays/overlay_service.dart';

class AlertDialogWidget extends StatelessWidget {
  final AlertConfig config;

  const AlertDialogWidget({super.key, required this.config});

  Color _typeColor(AlertType type) {
    switch (type) {
      case AlertType.success: return Colors.green;
      case AlertType.error: return Colors.red;
      case AlertType.warning: return Colors.orange;
      case AlertType.info: return Colors.blue;
    }
  }

  IconData _typeIcon(AlertType type) {
    switch (type) {
      case AlertType.success: return Icons.check_circle_outline_rounded;
      case AlertType.error: return Icons.block_rounded;
      case AlertType.warning: return Icons.warning_amber_rounded;
      case AlertType.info: return Icons.info_outline_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    final r = context.responsive;
    final theme = config.theme ?? AlertTheme.defaultTheme;

    return GestureDetector(
      onTap: () => OverlayService().close(),
      child: Material(
        color: Colors.black.withOpacity(0.5),
        child: Center(
          child: AnimatedContainer(
            duration: theme.animationDuration ?? const Duration(milliseconds: 350),
            width: r.wp(80),
            padding: EdgeInsets.all(r.wp(6)),
            decoration: BoxDecoration(
              color: theme.backgroundColor,
              borderRadius: theme.borderRadius,
              boxShadow: theme.shadow,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(_typeIcon(config.type), color: _typeColor(config.type), size: r.wp(14)),
                SizedBox(height: r.hp(2)),
                Text(
                  config.title,
                  style: theme.titleStyle?.copyWith(color: _typeColor(config.type)),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: r.hp(1)),
                Text(
                  config.description,
                  style: theme.descriptionStyle,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: r.hp(2)),
                ElevatedButton(
                  style: theme.buttonStyle,
                  onPressed: config.onPressed ?? () => OverlayService().close(),
                  child: Text(config.buttonText ?? 'OK'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
