// Package imports:
import 'package:intl/intl.dart';

/// Extensions to help with [DateTime].
extension DateTimeExtensions on DateTime {
  /// Converts a [DateTime] to a [String] that respects the RFC 3339 convention.
  String toRFC3339() => '${DateFormat('yyyy-MM-ddTHH:mm:ssZ').format(this)}Z';

  /// Converts a [DateTime] to a [String] with the ```yyyy-MM-dd``` format.
  String toYearMonthDay() => DateFormat('yyyy-MM-dd').format(this);
}
