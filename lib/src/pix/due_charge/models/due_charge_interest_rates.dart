// Dart imports:

class DueChargeInterestRate {
  final double value;
  final InterestRateModality modality;

  const DueChargeInterestRate({
    required this.value,
    required this.modality,
  });

  Map<String, dynamic> toMap() => <String, dynamic>{
        'valorPerc': value.toStringAsFixed(2),
        'modalidade': modality.domain,
      };

  factory DueChargeInterestRate.fromMap(Map<String, dynamic> map) =>
      DueChargeInterestRate(
        value: double.parse(map['valorPerc']),
        modality: InterestRateModality.match(map['modalidade']),
      );

  DueChargeInterestRate copyWith({
    double? value,
    InterestRateModality? modality,
  }) =>
      DueChargeInterestRate(
        value: value ?? this.value,
        modality: modality ?? this.modality,
      );
}

enum InterestRateModality {
  valueCalendarDays(1),
  percentagePerDayCalendarDay(2),
  percentagePerMonthCalendarDay(3),
  percentagePerYearCalendarDay(4),
  valueWorkingDays(5),
  percentagePerDayWorkingDay(6),
  percentagePerMonthWorkingDay(7),
  percentagePerYearWorkingDay(8);

  final int domain;

  const InterestRateModality(this.domain);

  factory InterestRateModality.match(int value) =>
      InterestRateModality.values.firstWhere(
        (modality) => modality.domain == value,
        orElse: () => throw ArgumentError.value(value),
      );
}
