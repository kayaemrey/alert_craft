import 'package:alert_craft/core/alert_theme.dart';
import 'package:flutter/material.dart';
import '../enums/alert_type.dart';
import '../models/alert_config.dart';
import '../models/selection_config.dart';
import '../models/loading_config.dart';
import '../models/toast_config.dart';
import '../models/custom_config.dart';
import '../widgets/alert_dialog.dart';
import '../widgets/selection_dialog.dart';
import '../widgets/loading_dialog.dart';
import '../widgets/toast_message.dart';
import '../widgets/custom_dialog.dart';
import '../overlays/overlay_service.dart';

class AlertManager {
  static final AlertManager _instance = AlertManager._internal();
  factory AlertManager() => _instance;
  AlertManager._internal();

  void showAlert({
    required AlertType type,
    required String title,
    required String description,
    String? buttonText,
    VoidCallback? onPressed,
    AlertTheme? theme,
  }) {
    OverlayService().show(
      AlertDialogWidget(
        config: AlertConfig(
          type: type,
          title: title,
          description: description,
          buttonText: buttonText,
          onPressed: onPressed,
          theme: theme,
        ),
      ),
    );
  }

  void showSelection({
    required AlertType type,
    required String title,
    required String description,
    required String leftText,
    required String rightText,
    VoidCallback? onLeft,
    VoidCallback? onRight,
    AlertTheme? theme,
  }) {
    OverlayService().show(
      SelectionDialogWidget(
        config: SelectionConfig(
          type: type,
          title: title,
          description: description,
          leftText: leftText,
          rightText: rightText,
          onLeft: onLeft,
          onRight: onRight,
          theme: theme,
        ),
      ),
    );
  }

  void showLoading({
    String? message,
    Color? indicatorColor,
    AlertTheme? theme,
  }) {
    OverlayService().show(
      LoadingDialogWidget(
        config: LoadingConfig(
          message: message,
          indicatorColor: indicatorColor,
          theme: theme,
        ),
      ),
    );
  }

  void showToast({
    required AlertType type,
    required String message,
    Duration duration = const Duration(seconds: 2),
    AlertTheme? theme,
  }) {
    OverlayService().show(
      ToastMessageWidget(
        config: ToastConfig(
          type: type,
          message: message,
          duration: duration,
          theme: theme,
        ),
      ),
    );
  }

  void showCustom({
    required Widget child,
    AlertTheme? theme,
  }) {
    OverlayService().show(
      CustomDialogWidget(
        config: CustomConfig(
          child: child,
          theme: theme,
        ),
      ),
    );
  }

  void close() => OverlayService().close();
}
