import 'package:floor/floor.dart';

import '../logger/app_logger.dart';

class DatabaseDateTimeConverter extends TypeConverter<DateTime?, String?> {
  @override
  DateTime? decode(String? databaseValue) {
    if (databaseValue != null) {
      try {
        return DateTime.parse(databaseValue).toLocal();
      } catch (ex) {
        AppLogger.e(ex);
      }
    }

    return null;
  }

  @override
  String? encode(DateTime? value) {
    return value?.toUtc().toIso8601String();
  }
}
