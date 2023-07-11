// Project imports:
import '../../../config/utils/date_extensions.dart';

sealed class DueChargeDiscount {
  const DueChargeDiscount();

  Map<String, dynamic> toMap();

  static DueChargeDiscount fromMap(Map<String, dynamic> map) {
    if (map.containsKey('valorPerc')) {
      return DueChargeDiscountAnticipationPerDay.fromMap(map);
    }
    if (map.containsKey('descontoDataFixa')) {
      return DueChargeDiscountUntilDate.fromMap(map);
    }

    throw ArgumentError.value(map);
  }
}

class DueChargeDiscountUntilDate extends DueChargeDiscount {
  final DueChargeDiscountUntilDateModality modality;
  final List<(DateTime, double)> dates;

  const DueChargeDiscountUntilDate({
    required this.modality,
    required this.dates,
  });

  factory DueChargeDiscountUntilDate.fromMap(Map<String, dynamic> map) =>
      DueChargeDiscountUntilDate(
        modality:
            DueChargeDiscountUntilDateModality.match(map['modalidade'] as int),
        dates: (map['descontoDataFixa'] as List<dynamic>)
            .map<(DateTime, double)>(
              (data) => (
                DateTime.parse(data['data']),
                double.parse(data['valorPerc']),
              ),
            )
            .toList(),
      );

  @override
  Map<String, dynamic> toMap() => <String, dynamic>{
        'modalidade': modality.domain,
        'descontoDataFixa': dates
            .map(
              (date) => <String, dynamic>{
                'data': date.$1.toYearMonthDay(),
                'valorPerc': date.$2.toStringAsFixed(2),
              },
            )
            .toList(),
      };
}

enum DueChargeDiscountUntilDateModality {
  fixedValue(1),
  percentageValue(2);

  final int domain;

  const DueChargeDiscountUntilDateModality(this.domain);

  factory DueChargeDiscountUntilDateModality.match(int value) =>
      DueChargeDiscountUntilDateModality.values.firstWhere(
        (modality) => modality.domain == value,
        orElse: () => throw ArgumentError.value(value),
      );
}

class DueChargeDiscountAnticipationPerDay extends DueChargeDiscount {
  final DueChargeDiscountAnticipationPerDayModality modality;
  final double value;

  const DueChargeDiscountAnticipationPerDay({
    required this.modality,
    required this.value,
  });

  factory DueChargeDiscountAnticipationPerDay.fromMap(
    Map<String, dynamic> map,
  ) =>
      DueChargeDiscountAnticipationPerDay(
        modality: DueChargeDiscountAnticipationPerDayModality.match(
          map['modalidade'] as int,
        ),
        value: double.parse(map['valorPerc']),
      );

  @override
  Map<String, dynamic> toMap() => {
        'modalidade': modality.domain,
        'valorPerc': value.toStringAsFixed(2),
      };
}

enum DueChargeDiscountAnticipationPerDayModality {
  amountInAdvancePerCalendarDay(3),
  amountInAdvancePerWorkingDay(4),
  percentageInAdvancePerCalendarDay(5),
  percentageInAdvancePerWorkingDay(6);

  final int domain;

  const DueChargeDiscountAnticipationPerDayModality(this.domain);

  factory DueChargeDiscountAnticipationPerDayModality.match(int value) =>
      DueChargeDiscountAnticipationPerDayModality.values.firstWhere(
        (modality) => modality.domain == value,
        orElse: () => throw ArgumentError.value(value),
      );
}
