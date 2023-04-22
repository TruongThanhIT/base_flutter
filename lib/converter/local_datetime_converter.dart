import 'package:json_annotation/json_annotation.dart';

import '../logger/app_logger.dart';

class LocalDateTimeConverter implements JsonConverter<DateTime?, String?> {
  const LocalDateTimeConverter();

  @override
  DateTime fromJson(String? json) {
    if (json != null) {
      try {
        return DateTime.parse(json).toLocal();
      } catch (ex) {
        AppLogger.e(
          '''
          Can NOT parse `$json` to DateTime: $ex
          `DateTime.now()` will be returned for this case
          ''',
        );
      }
    }

    return DateTime.now();
  }

  @override
  String? toJson(DateTime? json) {
    return json?.toUtc().toIso8601String();
  }
}

class LocalDateTimeConverterWithNullable
    implements JsonConverter<DateTime?, String?> {
  const LocalDateTimeConverterWithNullable();

  @override
  DateTime? fromJson(String? json) {
    if (json != null && json.trim().isNotEmpty) {
      try {
        final dt = DateTime.parse(json).toLocal();
        return dt;
      } catch (ex) {
        AppLogger.e(
          '''
          Can NOT parse `$json` to DateTime: $ex
          `null` value will be returned for this case
          ''',
        );
      }
    }

    return null;
  }

  @override
  String? toJson(DateTime? object) => object?.toUtc().toIso8601String();
}
