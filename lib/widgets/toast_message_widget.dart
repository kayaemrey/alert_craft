import 'dart:async';
import 'package:alert_craft/service/screen_responsive_size.dart';
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
      OverlayService().removeOverlay();
    });
  }

  @override
  Widget build(BuildContext context) {
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

    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
            decoration: BoxDecoration(
              color: widget.backgroundColor ?? color,
              borderRadius: BorderRadius.circular(10.0),
            ),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
            child: Row(
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 1.3.h(context),
                    ),
                    Icon(
                      icon,
                      size: 50,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5.w(context),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          widget.title,
                          style: Theme.of(context).textTheme.titleMedium,
                          textAlign: TextAlign.center,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            widget.description,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1.h(context),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
