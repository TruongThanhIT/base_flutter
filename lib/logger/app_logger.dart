import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

final logger = Logger(filter: AppLogFilter());

class AppLogFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    if (kReleaseMode || Platform.environment.containsKey('FLUTTER_TEST')) {
      return false;
    }
    return true;
  }
}

class AppLogger {
  static void d(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    logger.d(message, error, stackTrace);
  }

  static void i(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    logger.i(message, error, stackTrace);
  }

  static void e(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    logger.e(message, error, stackTrace);
  }
}
