import 'dart:io';

import 'package:get/get.dart';

class DeviceUlti {
  static bool isTablet() {
    return Get.width >= 600;
  }

  static bool isIOS() {
    return Platform.isIOS;
  }

  static bool isAndroid() {
    return Platform.isAndroid;
  }
}
