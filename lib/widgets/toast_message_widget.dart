import 'dart:async';
import 'dart:ui';
import 'package:alert_craft/core/screen_responsive_size.dart';
import 'package:flutter/material.dart';
import '../enum/type_enum.dart';
import '../service/overlay_service.dart';


class ToastMessageWidget extends StatefulWidget {
  final AlertType type;
  final String title;
  final String description;
  final Color? backgroundColor;

  const ToastMessageWidget({
    super.key,
    required this.type,
    required this.title,
    required this.description,
    this.backgroundColor,
  });

  @override
  State<ToastMessageWidget> createState() => _ToastMessageWidgetState();
}

class _ToastMessageWidgetState extends State<ToastMessageWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
    _controller.forward();

    Timer(const Duration(seconds: 3), () {
      OverlayService().closeOverlay();
    });
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
        return Icons.check_rounded;
      case AlertType.error:
        return Icons.close_rounded;
      case AlertType.warning:
        return Icons.warning_amber_rounded;
      case AlertType.info:
        return Icons.info_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    final sizer = ScreenSizer(context);

    final double borderRadius = sizer.wp(6);
    final double verticalPadding = sizer.hp(1.6);
    final double horizontalPadding = sizer.wp(4.5);
    final double iconCircle = sizer.wp(12);
    final double iconSize = sizer.wp(6.5);
    final double iconRightPadding = sizer.wp(4);
    final double bottomMargin = sizer.hp(5);
    final double horizontalMargin = sizer.wp(5);

    return Padding(
      padding: EdgeInsets.only(
        bottom: bottomMargin,
        left: horizontalMargin,
        right: horizontalMargin,
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: SlideTransition(
          position: _offsetAnimation,
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(borderRadius),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
                child: Container(
                  decoration: BoxDecoration(
                    color: (widget.backgroundColor ?? Colors.white.withOpacity(0.15)),
                    borderRadius: BorderRadius.circular(borderRadius),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.13),
                        blurRadius: 24,
                        offset: const Offset(0, 8),
                      ),
                    ],
                    border: Border.all(
                      color: _mainColor.withOpacity(0.14),
                      width: 1.4,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: verticalPadding,
                    horizontal: horizontalPadding,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Renkli daire ikon
                      Container(
                        width: iconCircle,
                        height: iconCircle,
                        decoration: BoxDecoration(
                          color: _mainColor.withOpacity(0.13),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(
                            _icon,
                            size: iconSize,
                            color: _mainColor,
                          ),
                        ),
                      ),
                      SizedBox(width: iconRightPadding),
                      // Metinler
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              widget.title,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    letterSpacing: 0.05,
                                  ),
                            ),
                            if (widget.description.trim().isNotEmpty)
                              Padding(
                                padding: EdgeInsets.only(top: sizer.hp(0.7)),
                                child: Text(
                                  widget.description,
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white.withOpacity(0.92),
                                      ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
