import 'dart:ui';
import 'package:alert_craft/service/overlay_service.dart';
import 'package:alert_craft/service/screen_responsive_size.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {

  final Color? backgroundColor;
  const LoadingWidget({
    super.key, 
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
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
                width: 60.w(context),
                height: 20.h(context),
                decoration: BoxDecoration(color: backgroundColor ?? Theme.of(context).scaffoldBackgroundColor, borderRadius: BorderRadius.circular(10.0)),
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                child: const Center(child: CircularProgressIndicator(),),
              ),
            ),
          ),
        ],
      ),
    );
  }
}