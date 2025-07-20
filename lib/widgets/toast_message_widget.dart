import 'dart:async';
import 'package:alert_craft/core/screen_responsive_size.dart';
import 'package:flutter/material.dart';
import '../service/overlay_service.dart';

class ToastMessageWidget extends StatefulWidget {
  final int type;
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
  _ToastMessageWidgetState createState() => _ToastMessageWidgetState();
}

class _ToastMessageWidgetState extends State<ToastMessageWidget> {
  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    Timer(const Duration(seconds: 3), () {
      OverlayService().closeOverlay();
    });
  }

  @override
  Widget build(BuildContext context) {
    final sizer = ScreenSizer(context);

    Color color = Colors.green;
    switch (widget.type) {
      case 1:
        color = Colors.green;
        break;
      case 2:
        color = Colors.red;
        break;
      default:
        color = Colors.orange;
        break;
    }

    IconData icon = Icons.info_outline_rounded;
    switch (widget.type) {
      case 1:
        icon = Icons.check_circle_outline_rounded;
        break;
      case 2:
        icon = Icons.block_rounded;
        break;
      default:
        icon = Icons.info_outline_rounded;
        break;
    }

    // Responsive ölçüler
    final double borderRadius = sizer.wp(4);
    final double verticalPadding = sizer.hp(2);
    final double horizontalPadding = sizer.wp(4);
    final double iconSize = sizer.wp(10);
    final double iconRightPadding = sizer.wp(4);
    final double bottomMargin = sizer.hp(5);
    final double horizontalMargin = sizer.wp(4);

    return Padding(
      padding: EdgeInsets.only(
        bottom: bottomMargin,
        left: horizontalMargin,
        right: horizontalMargin,
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          decoration: BoxDecoration(
            color: widget.backgroundColor ?? color,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          padding: EdgeInsets.symmetric(
            vertical: verticalPadding,
            horizontal: horizontalPadding,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                icon,
                size: iconSize,
                color: Colors.white,
              ),
              SizedBox(width: iconRightPadding),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500, color: Colors.white),
                    ),
                    SizedBox(height: sizer.hp(0.5)),
                    Text(
                      widget.description,
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
