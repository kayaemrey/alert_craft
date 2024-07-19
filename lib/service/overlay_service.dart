import 'package:flutter/material.dart';
import "package:get/get.dart";

bool _haveOverlay = false;

class OverlayService {
  static OverlayService? _instance;
  final ValueNotifier<OverlayEntry?> _overlayEntry = ValueNotifier(null);

  OverlayService._internal() {
    _instance = this;
  }

  factory OverlayService() => _instance ?? OverlayService._internal();

  void showCustomOverlay({
    bool forceOverlay = false,
    required Widget child,
  }) {
    if (forceOverlay) closeOverlay();
    if (_haveOverlay) return;
    OverlayState? overlayState = Get.key.currentState?.overlay;
    if (overlayState == null) return;

    final myoverlayEntry = OverlayEntry(
      builder: (BuildContext context) {
        return child;
      },
    );
    _overlayEntry.value = myoverlayEntry;

    overlayState.insert(_overlayEntry.value!);
    _haveOverlay = true;
  }

  closeOverlay() {
    if (_overlayEntry.value == null) return;
    _haveOverlay = false;
    _overlayEntry.value!.remove();
    _overlayEntry.value = null;
  }

  bool isInUse() => _overlayEntry.value != null;
}
