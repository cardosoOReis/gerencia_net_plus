// Package imports:
import 'package:intl/intl.dart';

extension ToRFC3339 on DateTime {
  String toRFC3339() {
    return '${DateFormat('yyyy-MM-ddTHH:mm:ssZ').format(this)}Z';
  }
}
