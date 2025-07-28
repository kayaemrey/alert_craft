import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:alert_craft/service/overlay_service.dart';
import 'package:alert_craft/core/screen_responsive_size.dart';

class CustomAlertWidget extends StatefulWidget {
  final Widget child;
  final Color? backgroundColor;

  const CustomAlertWidget({
    super.key,
    required this.child,
    this.backgroundColor,
  });

  @override
  State<CustomAlertWidget> createState() => _CustomAlertWidgetState();
}

class _CustomAlertWidgetState extends State<CustomAlertWidget>
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

  @override
  Widget build(BuildContext context) {
    final sizer = ScreenSizer(context);

    // Responsive ölçüler
    final double dialogWidth = sizer.wp(80);
    final double borderRadius = sizer.wp(4);
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
                        widget.child,
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
