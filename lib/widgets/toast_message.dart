import 'package:flutter/material.dart';
import '../models/toast_config.dart';
import '../core/responsive.dart';
import '../core/alert_theme.dart';
import '../enums/alert_type.dart';
import '../overlays/overlay_service.dart';

class ToastMessageWidget extends StatefulWidget {
  final ToastConfig config;

  const ToastMessageWidget({super.key, required this.config});

  @override
  State<ToastMessageWidget> createState() => _ToastMessageWidgetState();
}

class _ToastMessageWidgetState extends State<ToastMessageWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  Color _typeColor(AlertType type) {
    switch (type) {
      case AlertType.success: return Colors.green;
      case AlertType.error: return Colors.red;
      case AlertType.warning: return Colors.orange;
      case AlertType.info: return Colors.blue;
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 350),
      vsync: this,
    );
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _controller.forward();
    Future.delayed(widget.config.duration, () {
      _controller.reverse().then((_) => OverlayService().close());
    });
  }

  @override
  Widget build(BuildContext context) {
    final r = context.responsive;
    final theme = widget.config.theme ?? AlertTheme.defaultTheme;

    return Positioned(
      bottom: r.hp(10),
      left: r.wp(10),
      right: r.wp(10),
      child: SlideTransition(
        position: _offsetAnimation,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: r.hp(2), horizontal: r.wp(5)),
            decoration: BoxDecoration(
              color: _typeColor(widget.config.type),
              borderRadius: theme.borderRadius,
              boxShadow: theme.shadow,
            ),
            child: Text(
              widget.config.message,
              style: theme.descriptionStyle?.copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
