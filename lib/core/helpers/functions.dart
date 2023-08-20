import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeUtils {
  DateTimeUtils._();

  static Future<TimeOfDay?> pickTime({
    required BuildContext context,
    TimeOfDay? initialTime,
  }) async {
    final time = await showTimePicker(
      context: context,
      initialTime: initialTime ?? TimeOfDay.now(),
    );

    if (time == null) return null;
    return time;
  }

  static Future<DateTime?> pickDate(
    BuildContext context, {
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
  }) async {
    final date = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: firstDate ?? DateTime(DateTime.now().year - 100),
      lastDate: lastDate ?? DateTime(DateTime.now().year + 100),
    );

    if (date == null) return null;
    return date;
  }

  static DateTime getDate(String formattedDate) {
    return DateFormat('yyyy-MM-dd').parse(formattedDate);
  }

  static DateTime getTime(String formattedTime) {
    // final now = new DateTime.now();
    // final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    // final format = DateFormat.jm();  //"6:00 AM"
    // return format.parse(inputString);
    final format = DateFormat('jm');
    return format.parse(formattedTime);
  }

  static String getDateStr(DateTime date) {
    return DateFormat.yMMMMd('en_US').format(date);
  }

  static String getDateNum(DateTime date) {
    return DateFormat('MM/dd/yyyy').format(date);
  }

  static String formatDateInAMPM(DateTime date) {
    int hour = date.hour;
    int minute = date.minute;

    String ampm = hour >= 12 ? 'PM' : 'AM';

    hour = hour % 12;
    hour = hour == 0 ? 12 : hour;

    String hr = hour < 10 ? '0$hour' : hour.toString();
    String mn = minute < 10 ? '0$minute' : minute.toString();

    return '$hr:$mn $ampm';
  }

  static String formatTimeInAMPM(TimeOfDay time) {
    DateTime tempDate = DateFormat.Hms().parse(time.hour.toString() +
        ":" +
        time.minute.toString() +
        ":" +
        '0' +
        ":" +
        '0');
    var dateFormat = DateFormat("h:mm a");
    return (dateFormat.format(tempDate));
  }
}

Future<void> fakeNetworkDelay({int seconds = 2}) async {
  await Future.delayed(Duration(seconds: seconds));
}

List<String> exceptions = [
  'a',
  'abaft',
  'about',
  'above',
  'afore',
  'after',
  'along',
  'amid',
  'among',
  'an',
  'apud',
  'as',
  'aside',
  'at',
  'atop',
  'below',
  'but',
  'by',
  'circa',
  'down',
  'for',
  'from',
  'given',
  'in',
  'into',
  'lest',
  'like',
  'mid',
  'midst',
  'minus',
  'near',
  'next',
  'of',
  'off',
  'on',
  'onto',
  'out',
  'over',
  'pace',
  'past',
  'per',
  'plus',
  'pro',
  'qua',
  'round',
  'sans',
  'save',
  'since',
  'than',
  'thru',
  'till',
  'times',
  'to',
  'under',
  'until',
  'unto',
  'up',
  'upon',
  'via',
  'vice',
  'with',
  'worth',
  'the","and',
  'nor',
  'or',
  'yet',
  'so'
];

extension TitleCase on String {
  String get toTitleCase {
    return toLowerCase().replaceAllMapped(
        RegExp(
            r'[A-Z]{2,}(?=[A-Z][a-z]+[0-9]*|\b)|[A-Z]?[a-z]+[0-9]*|[A-Z]|[0-9]+'),
        (Match match) {
      if (exceptions.contains(match[0])) {
        return match[0]!;
      }
      return "${match[0]![0].toUpperCase()}${match[0]!.substring(1).toLowerCase()}";
    }).replaceAll(RegExp(r'(_|-)+'), ' ');
  }
}
