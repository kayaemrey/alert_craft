import 'package:flutter/material.dart';
import '../models/loading_config.dart';
import '../core/responsive.dart';
import '../core/alert_theme.dart';
import '../overlays/overlay_service.dart';

class LoadingDialogWidget extends StatelessWidget {
  final LoadingConfig config;

  const LoadingDialogWidget({super.key, required this.config});

  @override
  Widget build(BuildContext context) {
    final r = context.responsive;
    final theme = config.theme ?? AlertTheme.defaultTheme;

    return Material(
      color: Colors.black.withOpacity(0.5),
      child: Center(
        child: AnimatedContainer(
          duration: theme.animationDuration ?? const Duration(milliseconds: 350),
          width: r.wp(50),
          padding: EdgeInsets.all(r.wp(6)),
          decoration: BoxDecoration(
            color: theme.backgroundColor,
            borderRadius: theme.borderRadius,
            boxShadow: theme.shadow,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(
                color: config.indicatorColor ?? Theme.of(context).primaryColor,
              ),
              if (config.message != null) ...[
                SizedBox(height: r.hp(2)),
                Text(
                  config.message!,
                  style: theme.descriptionStyle,
                  textAlign: TextAlign.center,
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
