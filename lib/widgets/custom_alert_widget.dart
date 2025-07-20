import 'dart:ui';
import 'package:alert_craft/service/overlay_service.dart';
import 'package:alert_craft/core/screen_responsive_size.dart';
import 'package:flutter/material.dart';

class CustomAlertWidget extends StatelessWidget {
  final Widget widget;
  final Color? backgroundColor;
  const CustomAlertWidget({
    super.key,
    required this.widget,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final sizer = ScreenSizer(context);

    // Responsive ölçüler
    final double dialogWidth = sizer.wp(80); // %80 genişlik
    final double borderRadius = sizer.wp(4); // %4 genişlik kadar radius
    final double verticalPadding = sizer.hp(2); // %2 dikey padding
    final double horizontalPadding = sizer.wp(4); // %4 yatay padding

    return Positioned.fill(
      child: Stack(
        children: [
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
          Positioned.fill(
            child: Center(
              child: Container(
                width: dialogWidth,
                decoration: BoxDecoration(
                  color: backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: verticalPadding,
                  horizontal: horizontalPadding,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    widget,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
