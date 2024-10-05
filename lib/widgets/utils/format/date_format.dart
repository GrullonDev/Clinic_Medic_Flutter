import 'package:intl/intl.dart';

class AppDateUtils {
  const AppDateUtils._();

  /// Used to format date in all app
  static final DateFormat appFormat = DateFormat('dd/MM/yyyy');
  static final DateFormat appFormatWithHour = DateFormat('dd/MM/yyyy hh:mm a');

  /// Used to format date for graph ql ewallet
  static final DateFormat dbFormat = DateFormat('yyyy-MM-dd');

  /// Used to format Month and Year
  static final DateFormat monthYearFormat = DateFormat('MMMM yyyy', 'es');

  /// Used to format date of transacctions in E-wallet
  static final DateFormat dbFormatWithHour =
      DateFormat("yyyy-MM-dd'T'HH:mm:ss");

  static DateTime? format(String? value, [DateFormat? dateFormat]) {
    if (value == null || value.isEmpty) return null;

    return (dateFormat ?? appFormat).parse(value);
  }

  /// Formats a DateTime object into a string using the month and year format.
  static String formattedMonthYear(DateTime date) {
    final formattedDate = monthYearFormat.format(date);
    // Capitalize the first letter of the formatted date string
    return toBeginningOfSentenceCase(formattedDate) ?? formattedDate;
  }
}

extension DateTimeExt on DateTime {
  String display([DateFormat? format]) {
    return (format ?? AppDateUtils.appFormat).format(this);
  }

  /// Extends DateTime to include formatting for Month and Year in Spanish.
  String displayMonthYear() {
    return AppDateUtils.formattedMonthYear(this);
  }
}
