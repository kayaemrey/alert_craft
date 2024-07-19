import 'package:flutter/material.dart';

import '../core/app_info.dart';

class ClassicLoadingOverlay extends StatelessWidget {
  final ValueNotifier<OverlayEntry?> overlayEntry;
  ClassicLoadingOverlay({
    required this.overlayEntry,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      right: 0,
      child: Material(
        color: Colors.black26,
        child: SafeArea(
          child: Center(
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black.withOpacity(0.35),
                ),
                child: SizedBox(
                  width: 48,
                  height: 48,
                  child: Center(
                    child: CircularProgressIndicator.adaptive(
                      backgroundColor: (AppInfo.isIOS == true) ? Colors.white : Colors.transparent,
                      valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                      strokeWidth: 3.25,
                    ),
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
