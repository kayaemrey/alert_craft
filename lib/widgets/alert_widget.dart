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
                width: 80.w(context),
                decoration: BoxDecoration(color: backgroundColor ?? Theme.of(context).scaffoldBackgroundColor, borderRadius: BorderRadius.circular(10.0)),
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 1.3.h(context),
                    ),
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
                      child: Icon(
                        icon,
                        size: 36,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 1.5.h(context),
                    ),
                    Text(
                      title,
                      style: Theme.of(context).textTheme.displayLarge,
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(description, textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500)),
                    ),
                    SizedBox(
                      height: 1.3.h(context),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: buttonColor ?? Theme.of(context).primaryColor, minimumSize: const Size(120, 38), maximumSize: const Size(120, 38)),
                      onPressed: () {
                        OverlayService().closeOverlay();
                      },
                      child: Text(buttonText ?? 'Ok', style: TextStyle(color: buttonColor ?? Colors.white)),
                    ),
                    SizedBox(
                      height: 1.h(context),
                    )
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
