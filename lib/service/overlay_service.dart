import 'package:flutter/material.dart';

class OverlayService {
  static final OverlayService _instance = OverlayService._internal();

  factory OverlayService() {
    return _instance;
  }

  OverlayService._internal();

  OverlayEntry? _overlayEntry;

  void showOverlay(BuildContext context, Widget widget) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_overlayEntry != null) {
        _overlayEntry!.remove();
      }

      _overlayEntry = OverlayEntry(builder: (context) => widget);

      Overlay.of(context).insert(_overlayEntry!);
    });
  }

  void removeOverlay() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
  }
}
