import 'package:intl/intl.dart';

import 'DiffDuration.dart';

class DateUtil {
  static const String DDMMYYYY = 'dd/MM/yyyy';
  static const String HHMM_DDMMYYYY = 'dd/MM/yyyy HH:mm';

  static String getDateStr(
    DateTime? dateTime, {
    String formatStr = DDMMYYYY,
    String? locale,
  }) {
    var format = DateFormat(formatStr, locale);

    if (dateTime == null) {
      return '';
    }
    return format.format(dateTime);
  }

  static String getTimeFromNumber(int? number) {
    if (number == null) {
      return '';
    }
    var min = number % 100;
    return '${number ~/ 100}: ${min == 0 ? '00' : min}';
  }

  static DateTime getFirstDateOfWeek(DateTime current) {
    return current.subtract(Duration(days: current.weekday - 1));
  }

  static DateTime getLastDateOfWeek(DateTime current) {
    return current.add(Duration(days: DateTime.daysPerWeek - current.weekday));
  }

  static DateTime getFirstDateOfMonth(DateTime current) {
    return DateTime(current.year, current.month, 1);
  }

  static DateTime getLastDateOfMonth(DateTime current) {
    return DateTime(current.year, current.month + 1, 0);
  }

  static DiffDuration getDurationBetweenTwoDate(
      DateTime fromDate, DateTime toDate) {
    var day = fromDate.difference(toDate).inDays;
    var hour = fromDate.difference(toDate).inHours - (day * 24);
    var minute =
        fromDate.difference(toDate).inMinutes - (day * 24 * 60 + hour * 60);
    return DiffDuration(day, hour, minute);
  }

  static String getStringDurationBetweenTwoDate(
      DateTime fromDate, DateTime toDate) {
    var diffDurationStr = '';
    var diffDuration = getDurationBetweenTwoDate(fromDate, toDate);

    if (diffDuration.day > 0) {
      diffDurationStr = '${diffDuration.day}D';
    }
    if (diffDuration.hour > 0) {
      diffDurationStr = diffDurationStr.isNotEmpty
          ? '$diffDurationStr ${diffDuration.hour}H'
          : '${diffDuration.hour}H';
    }
    if (diffDuration.minute > 0) {
      diffDurationStr = diffDurationStr.isNotEmpty
          ? '$diffDurationStr ${diffDuration.minute}M'
          : '${diffDuration.minute}M';
    }

    return diffDurationStr;
  }

  static DiffDuration getDDHHMMFromMin(int totalMin) {
    var minInDay = 24 * 60;
    var day = totalMin ~/ minInDay;
    var hour = (totalMin - (day * minInDay)) ~/ 60;
    var minute = totalMin - (day * minInDay) - (hour * 60);

    return DiffDuration(day, hour, minute);
  }

  static String getStringDDHHMMFromMin(int totalMin) {
    var duration = getDDHHMMFromMin(totalMin);

    var dayStr = '${duration.day}'.padLeft(2, '0');
    var hourStr = '${duration.hour}'.padLeft(2, '0');
    var minStr = '${duration.minute}'.padLeft(2, '0');

    return '$dayStr:$hourStr:$minStr';
  }
}
