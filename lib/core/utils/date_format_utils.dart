import 'package:intl/intl.dart';

import '../../index.dart';

class DateFormatUtils {
  static String formatDate(String dateTime) {
    if (dateTime.trim().isEmpty) return dateTime;

    DateTime date = DateTime.parse(dateTime);

    String dayWithSuffix = _getDayWithSuffix(date.day);

    return '$dayWithSuffix ${DateFormat(kDateFormat).format(date)}';
  }

  static String formatTime(String dateTime) {
    if (dateTime.trim().isEmpty) return dateTime;

    return DateFormat(kDateFormat1).format(DateTime.parse(dateTime));
  }

  /// Returns ordinal suffix for a day (1st, 2nd, 3rd, 4th, etc.)
  static String _getDayWithSuffix(int day) {
    if (day >= 11 && day <= 13) {
      return '${day}th';
    }
    switch (day % 10) {
      case 1:
        return '${day}st';
      case 2:
        return '${day}nd';
      case 3:
        return '${day}rd';
      default:
        return '${day}th';
    }
  }
}
