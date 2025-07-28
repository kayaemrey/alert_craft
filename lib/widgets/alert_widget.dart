import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:alert_craft/core/screen_responsive_size.dart';
import 'package:alert_craft/service/overlay_service.dart';
import '../enum/type_enum.dart';

class AlertDialogWidget extends StatefulWidget {
  final AlertType type;
  final String title;
  final String description;
  final Color? buttonColor;
  final String? buttonText;
  final Color? buttonTextColor;
  final Color? backgroundColor;

  const AlertDialogWidget({
    super.key,
    required this.type,
    required this.title,
    required this.description,
    this.buttonColor,
    this.buttonText,
    this.buttonTextColor,
    this.backgroundColor,
  });

  @override
  State<AlertDialogWidget> createState() => _AlertDialogWidgetState();
}

class _AlertDialogWidgetState extends State<AlertDialogWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 320),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );
    _scaleAnimation = Tween<double>(begin: 0.96, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Color get _mainColor {
    switch (widget.type) {
      case AlertType.success:
        return const Color(0xFF4CE417);
      case AlertType.error:
        return const Color(0xFFE60707);
      case AlertType.warning:
        return const Color(0xFFFFC107);
      case AlertType.info:
        return const Color(0xFF2353BC);
    }
  }

  IconData get _icon {
    switch (widget.type) {
      case AlertType.success:
        return Icons.check_circle_outline_rounded;
      case AlertType.error:
        return Icons.block_rounded;
      case AlertType.warning:
        return Icons.warning_amber_rounded;
      case AlertType.info:
        return Icons.info_outline_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    final sizer = ScreenSizer(context);

    // Responsive ölçüler
    final double dialogWidth = sizer.wp(80);
    final double iconSize = sizer.wp(12);
    final double iconContainer = sizer.wp(16);
    final double borderRadius = sizer.wp(4);
    final double buttonWidth = sizer.wp(32);
    final double buttonHeight = sizer.hp(5);

    final double verticalPadding = sizer.hp(2);
    final double horizontalPadding = sizer.wp(4);

    return Positioned.fill(
      child: Stack(
        children: [
          // Arka plan ve bulanıklık
          Positioned.fill(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                OverlayService().closeOverlay();
              },
              child: Container(color: Colors.black26.withOpacity(0.2)),
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
              child: Container(),
            ),
          ),
          // Animasyonlu dialog kutusu
          Positioned.fill(
            child: Center(
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: Container(
                    width: dialogWidth,
                    decoration: BoxDecoration(
                      color: widget.backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(borderRadius),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 18,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: verticalPadding,
                      horizontal: horizontalPadding,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: sizer.hp(1.3)),
                        Container(
                          width: iconContainer,
                          height: iconContainer,
                          decoration: BoxDecoration(
                            color: _mainColor.withOpacity(0.18),
                            borderRadius: BorderRadius.circular(borderRadius),
                          ),
                          child: Icon(
                            _icon,
                            size: iconSize,
                            color: _mainColor,
                          ),
                        ),
                        SizedBox(height: sizer.hp(1.5)),
                        Text(
                          widget.title,
                          style: TextStyle(
                            color: _mainColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.03,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: sizer.hp(1)),
                          child: Text(
                            widget.description,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.85),
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(height: sizer.hp(1.3)),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: widget.buttonColor ?? _mainColor,
                            minimumSize: Size(buttonWidth, buttonHeight),
                            maximumSize: Size(buttonWidth, buttonHeight),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(borderRadius),
                            ),
                            elevation: 0,
                          ),
                          onPressed: () {
                            OverlayService().closeOverlay();
                          },
                          child: Text(
                            widget.buttonText ?? 'Tamam',
                            style: TextStyle(
                              color: widget.buttonTextColor ?? Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(height: sizer.hp(1)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
