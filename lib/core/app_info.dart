import 'dart:io';

import 'package:package_info_plus/package_info_plus.dart';

class AppInfo {
  static String? version;
  static String? buildNumber;
  static bool? isAndroid, isIOS;

  static Future<void> init() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    AppInfo.version = packageInfo.version;
    AppInfo.buildNumber = packageInfo.buildNumber;
    AppInfo.isAndroid = Platform.isAndroid;
    AppInfo.isIOS = Platform.isIOS;
  }
}
