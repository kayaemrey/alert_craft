import 'dart:ui';
import 'package:alert_craft/service/overlay_service.dart';
import 'package:alert_craft/core/screen_responsive_size.dart';
import 'package:flutter/material.dart';

class AlertDialogWidget extends StatelessWidget {
  final int type;
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
    this.buttonTextColor,
    this.buttonText,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final sizer = ScreenSizer(context);

    Color color;
    IconData icon;
    switch (type) {
      case 1:
        color = Colors.green;
        icon = Icons.check_circle_outline_rounded;
        break;
      case 2:
        color = Colors.red;
        icon = Icons.block_rounded;
        break;
      default:
        color = Colors.orange;
        icon = Icons.info_outline_rounded;
        break;
    }

    // Responsive ölçüler
    final double dialogWidth = sizer.wp(80);
    final double iconSize = sizer.wp(12);
    final double iconContainer = sizer.wp(16);
    final double borderRadius = sizer.wp(4);
    final double buttonWidth = sizer.wp(32);
    final double buttonHeight = sizer.hp(5);

    // Responsive padding
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
                    SizedBox(height: sizer.hp(1.3)),
                    Container(
                      width: iconContainer,
                      height: iconContainer,
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(borderRadius),
                      ),
                      child: Icon(
                        icon,
                        size: iconSize,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: sizer.hp(1.5)),
                    Text(
                      title,
                      style: TextStyle(
                        color: color,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: sizer.hp(1), // responsive vertical padding
                      ),
                      child: Text(
                        description,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: color,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height: sizer.hp(1.3)),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttonColor ?? Theme.of(context).primaryColor,
                        minimumSize: Size(buttonWidth, buttonHeight),
                        maximumSize: Size(buttonWidth, buttonHeight),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(borderRadius),
                        ),
                      ),
                      onPressed: () {
                        OverlayService().closeOverlay();
                      },
                      child: Text(
                        buttonText ?? 'Ok',
                        style: TextStyle(
                          color: buttonTextColor ?? Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: sizer.hp(1)),
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
