import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:alert_craft/service/overlay_service.dart';
import 'package:alert_craft/core/screen_responsive_size.dart';
import '../enum/type_enum.dart';


class SelectionWidget extends StatefulWidget {
  final AlertType type;
  final String title;
  final String description;
  final Color? buttonColorLeft;
  final Color? buttonColorRight;
  final String? buttonTextLeft;
  final String? buttonTextRight;
  final Color? buttonTextColorLeft;
  final Color? buttonTextColorRight;
  final Color? backgroundColor;
  final VoidCallback? leftFunction;
  final VoidCallback? rightFunction;
  final bool dismissible;

  const SelectionWidget({
    super.key,
    required this.type,
    required this.title,
    required this.description,
    this.buttonColorLeft,
    this.buttonColorRight,
    this.buttonTextColorLeft,
    this.buttonTextColorRight,
    this.buttonTextLeft,
    this.buttonTextRight,
    this.backgroundColor,
    this.leftFunction,
    this.rightFunction,
    this.dismissible = true,
  });

  @override
  State<SelectionWidget> createState() => _SelectionWidgetState();
}

class _SelectionWidgetState extends State<SelectionWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
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

  (Color, IconData) _iconData() {
    switch (widget.type) {
      case AlertType.success:
        return (Colors.green, Icons.check_circle_outline_rounded);
      case AlertType.error:
        return (Colors.red, Icons.block_rounded);
      case AlertType.info:
      default:
        return (Colors.orange, Icons.info_outline_rounded);
    }
  }

  @override
  Widget build(BuildContext context) {
    final sizer = ScreenSizer(context);

    // Responsive ölçüler
    final double dialogWidth = sizer.wp(80);
    final double borderRadius = sizer.wp(4);
    final double verticalPadding = sizer.hp(2);
    final double horizontalPadding = sizer.wp(4);
    final double iconContainer = sizer.wp(14);
    final double iconSize = sizer.wp(8);
    final double buttonWidth = sizer.wp(32);
    final double buttonHeight = sizer.hp(5);
    final double sizedBoxSmall = sizer.hp(1.3);
    final double sizedBoxMedium = sizer.hp(1.5);
    final double textPaddingVertical = sizer.hp(1);

    final (Color color, IconData icon) = _iconData();

    return Positioned.fill(
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: Stack(
          children: [
            Positioned.fill(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: widget.dismissible
                    ? () => OverlayService().closeOverlay()
                    : null,
                child: Container(color: Colors.black26.withOpacity(0.2)),
              ),
            ),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                child: Container(),
              ),
            ),
            Positioned.fill(
              child: Center(
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: Container(
                    width: dialogWidth,
                    decoration: BoxDecoration(
                      color: widget.backgroundColor ??
                          Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(borderRadius),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: verticalPadding,
                      horizontal: horizontalPadding,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: sizedBoxSmall),
                        Container(
                          width: iconContainer,
                          height: iconContainer,
                          decoration: BoxDecoration(
                            color: color,
                            borderRadius:
                                BorderRadius.circular(borderRadius * 0.8),
                          ),
                          child: Icon(
                            icon,
                            size: iconSize,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: sizedBoxMedium),
                        Text(
                          widget.title,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: textPaddingVertical),
                          child: Text(
                            widget.description,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(height: sizedBoxSmall),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            if (widget.buttonTextLeft != null)
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: widget.buttonColorLeft ??
                                      Theme.of(context).primaryColor,
                                  minimumSize: Size(buttonWidth, buttonHeight),
                                  maximumSize: Size(buttonWidth, buttonHeight),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(borderRadius),
                                  ),
                                ),
                                onPressed: widget.leftFunction ??
                                    () {
                                      OverlayService().closeOverlay();
                                    },
                                child: Text(
                                  widget.buttonTextLeft ?? '',
                                  style: TextStyle(
                                    color: widget.buttonTextColorLeft ??
                                        Colors.white,
                                  ),
                                ),
                              ),
                            if (widget.buttonTextRight != null)
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: widget.buttonColorRight ??
                                      Theme.of(context).primaryColor,
                                  minimumSize: Size(buttonWidth, buttonHeight),
                                  maximumSize: Size(buttonWidth, buttonHeight),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(borderRadius),
                                  ),
                                ),
                                onPressed: widget.rightFunction ??
                                    () {
                                      OverlayService().closeOverlay();
                                    },
                                child: Text(
                                  widget.buttonTextRight ?? '',
                                  style: TextStyle(
                                    color: widget.buttonTextColorRight ??
                                        Colors.white,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        SizedBox(height: sizer.hp(1)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
