import 'dart:convert';

import '../../../config/utils/date_extensions.dart';

class DueChargeDiscount {
  final DiscountModality modality;
  final double? value;
  final List<FixedDateDiscount>? fixedDateDiscount;
  final bool _isUntilDate;

  DueChargeDiscount({
    required this.modality,
    this.value,
    this.fixedDateDiscount,
  }) : _isUntilDate = modality.domain == 1 || modality.domain == 2 {
    if (_isUntilDate) {
      if (fixedDateDiscount == null) {
        throw ArgumentError.value(
          fixedDateDiscount,
          'fixedDiscountValue',
          '''
          When modality is fixedValueUntilDate or percentualValueIntilDate, 
          fixedDateDiscount should not be null.
          ''',
        );
      }
    } else {
      if (value == null) {
        throw ArgumentError.value(
          value,
          'value',
          '''
          When modality is fixedValueForAdvanceCalendarDay, 
          percentualValueForAdvanceCalendarDay, 
          fixedValueForAdvanceBusinessDay or 
          percentualValueForAdvanceBusinessDay, 
          value should not be null.
          ''',
        );
      }
    }
  }

  Map<String, dynamic> toMap() => _isUntilDate
      ? <String, dynamic>{
          'modalidade': modality.domain,
          'descontoDataFixa': fixedDateDiscount!.map((e) => e.toMap()).toList(),
        }
      : <String, dynamic>{
          'modalidade': modality.domain,
          'valorPerc': value,
        };

  factory DueChargeDiscount.fromMap(Map<String, dynamic> map) {
    List<dynamic>? fixedDateDiscountJson = map['descontoDataFixa'];
    List<FixedDateDiscount>? fixedDateDiscount;
    if (fixedDateDiscountJson != null) {
      fixedDateDiscount = fixedDateDiscountJson
          .map((e) => FixedDateDiscount.fromMap(e as Map<String, dynamic>))
          .toList();
    }

    return DueChargeDiscount(
      modality: DiscountModality.match(map['modalidade'] as int),
      value: map['valorPerc'],
      fixedDateDiscount: fixedDateDiscount,
    );
  }

  String toJson() => json.encode(toMap());

  factory DueChargeDiscount.fromJson(String source) =>
      DueChargeDiscount.fromMap(json.decode(source) as Map<String, dynamic>);
}

enum DiscountModality {
  fixedValueUntilDate(1),
  percentualValueIntilDate(2),
  fixedValueForAdvanceCalendarDay(3),
  percentualValueForAdvanceCalendarDay(4),
  fixedValueForAdvanceBusinessDay(5),
  percentualValueForAdvanceBusinessDay(6);

  final int domain;

  const DiscountModality(this.domain);

  factory DiscountModality.match(int value) =>
      DiscountModality.values.firstWhere(
        (modality) => modality.domain == value,
        orElse: () => throw ArgumentError.value(value),
      );
}

class FixedDateDiscount {
  final double value;
  final DateTime date;

  const FixedDateDiscount({
    required this.value,
    required this.date,
  });

  Map<String, dynamic> toMap() => <String, dynamic>{
        'valorPerc': value.toStringAsFixed(2),
        'data': date.toRFC3339(),
      };

  factory FixedDateDiscount.fromMap(Map<String, dynamic> map) =>
      FixedDateDiscount(
        value: map['valorPerc'] as double,
        date: DateTime.parse(map['data']),
      );

  String toJson() => json.encode(toMap());

  factory FixedDateDiscount.fromJson(String source) =>
      FixedDateDiscount.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );
}
