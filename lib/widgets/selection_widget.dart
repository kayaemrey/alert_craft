import 'dart:ui';
import 'package:alert_craft/service/overlay_service.dart';
import 'package:alert_craft/core/screen_responsive_size.dart';
import 'package:flutter/material.dart';

class SelectionWidget extends StatelessWidget {
  final int type;
  final String title;
  final String description;
  final Color? buttonColorLeft;
  final Color? buttonColorRight;
  final String? buttonTextLeft;
  final String? buttonTextRight;
  final Color? buttonTextColor;
  final Color? backgroundColor;
  final Function()? leftFunction;
  final Function()? rightFunction;
  const SelectionWidget({
    super.key,
    required this.type,
    required this.title,
    required this.description,
    this.buttonColorLeft,
    this.buttonColorRight,
    this.buttonTextColor,
    this.buttonTextLeft,
    this.buttonTextRight,
    this.backgroundColor,
    this.leftFunction,
    this.rightFunction,
  });

  @override
  Widget build(BuildContext context) {
    final sizer = ScreenSizer(context);

    Color color = Colors.green;
    switch (type) {
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
    switch (type) {
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
    final double dialogWidth = sizer.wp(80); // %80 genişlik
    final double borderRadius = sizer.wp(4); // %4 genişlik kadar radius
    final double verticalPadding = sizer.hp(2); // %2 dikey padding
    final double horizontalPadding = sizer.wp(4); // %4 yatay padding

    final double iconContainer = sizer.wp(14); // ikon kutusu
    final double iconSize = sizer.wp(8); // ikon boyutu

    final double buttonWidth = sizer.wp(32); // buton genişliği
    final double buttonHeight = sizer.hp(5); // buton yüksekliği

    final double sizedBoxSmall = sizer.hp(1.3);
    final double sizedBoxMedium = sizer.hp(1.5);

    final double textPaddingVertical = sizer.hp(1);

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
                    SizedBox(height: sizedBoxSmall),
                    Container(
                      width: iconContainer,
                      height: iconContainer,
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(borderRadius * 0.8),
                      ),
                      child: Icon(
                        icon,
                        size: iconSize,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: sizedBoxMedium),
                    Text(
                      title,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: textPaddingVertical),
                      child: Text(
                        description,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(height: sizedBoxSmall),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: buttonColorLeft ?? Theme.of(context).primaryColor,
                            minimumSize: Size(buttonWidth, buttonHeight),
                            maximumSize: Size(buttonWidth, buttonHeight),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(borderRadius),
                            ),
                          ),
                          onPressed: leftFunction ??
                              () {
                                OverlayService().closeOverlay();
                              },
                          child: Text(
                            buttonTextLeft ?? 'Close',
                            style: TextStyle(
                              color: buttonTextColor ?? Colors.white,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: buttonColorRight ?? Theme.of(context).primaryColor,
                            minimumSize: Size(buttonWidth, buttonHeight),
                            maximumSize: Size(buttonWidth, buttonHeight),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(borderRadius),
                            ),
                          ),
                          onPressed: rightFunction ??
                              () {
                                OverlayService().closeOverlay();
                              },
                          child: Text(
                            buttonTextRight ?? 'Ok',
                            style: TextStyle(
                              color: buttonTextColor ?? Colors.white,
                            ),
                          ),
                        )
                      ],
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
