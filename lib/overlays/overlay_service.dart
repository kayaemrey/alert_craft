import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OverlayService {
  static final OverlayService _instance = OverlayService._internal();
  factory OverlayService() => _instance;
  OverlayService._internal();

  OverlayEntry? _entry;
  bool _haveOverlay = false;

  void show(Widget child, {bool forceOverlay = false}) {
    if (forceOverlay) close();
    if (_haveOverlay) return;

    final overlayState = Get.key.currentState?.overlay;
    if (overlayState == null) {
      debugPrint('OverlayService: Get.key.currentState?.overlay is null!');
      return;
    }

    _entry = OverlayEntry(builder: (_) => child);
    overlayState.insert(_entry!);
    _haveOverlay = true;
  }

  void close() {
    if (_entry == null) return;
    _entry?.remove();
    _entry = null;
    _haveOverlay = false;
  }

  bool isInUse() => _entry != null;
}
