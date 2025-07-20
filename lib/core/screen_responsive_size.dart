import 'package:flutter/material.dart';

/// Ekran boyutları, oranlama ve responsive işlemleri için yardımcı sınıf.
class ScreenSizer {
  final BuildContext context;
  late final Size _size;
  late final double _statusBar;
  late final double _bottomInset;

  ScreenSizer(this.context) {
    final mediaQuery = MediaQuery.of(context);
    _size = mediaQuery.size;
    _statusBar = mediaQuery.padding.top;
    _bottomInset = mediaQuery.padding.bottom;
  }

  /// Ekran genişliği (px)
  double get width => _size.width;

  /// Ekran yüksekliği (px)
  double get height => _size.height;

  /// Safe area hariç yükseklik (px)
  double get safeHeight => _size.height - _statusBar - _bottomInset;

  /// Status bar yüksekliği
  double get statusBarHeight => _statusBar;

  /// Alt çentik (notch) yüksekliği
  double get bottomInset => _bottomInset;

  /// Yatayda yüzdeye göre boyut
  double wp(double percent) => width * percent / 100;

  /// Dikeyde yüzdeye göre boyut
  double hp(double percent) => height * percent / 100;

  /// Safe area'ya göre dikeyde yüzde
  double shp(double percent) => safeHeight * percent / 100;

  /// Responsive font size (temel alınan: ekran genişliği)
  double sp(double size) => size * width / 375; // 375 iPhone 11 referans alınmıştır

  /// Orientation kontrolü
  bool get isPortrait => height > width;
  bool get isLandscape => width > height;

  /// MediaQuery erişimi
  MediaQueryData get mediaQuery => MediaQuery.of(context);

  /// Ekran oranı
  double get aspectRatio => width / height;
}

/// Kolay kullanım için extension
extension ScreenSizerExtension on BuildContext {
  ScreenSizer get sizer => ScreenSizer(this);

  /// Kısa yol: context.wp(50) = ekranın %50 genişliği
  double wp(double percent) => sizer.wp(percent);

  /// Kısa yol: context.hp(30) = ekranın %30 yüksekliği
  double hp(double percent) => sizer.hp(percent);

  /// Safe area ile: context.shp(80)
  double shp(double percent) => sizer.shp(percent);

  /// Responsive font size: context.sp(16)
  double sp(double size) => sizer.sp(size);
}

/// num extension ile klasik kullanım
extension NumScreenSizer on num {
  double wp(BuildContext context) => this * context.sizer.width / 100;
  double hp(BuildContext context) => this * context.sizer.height / 100;
  double shp(BuildContext context) => this * context.sizer.safeHeight / 100;
  double sp(BuildContext context) => this * context.sizer.sp(toDouble());
}
