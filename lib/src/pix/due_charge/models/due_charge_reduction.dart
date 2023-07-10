import 'dart:convert';

class DueChargeReduction {
  final double value;
  final ReductionModality modality;

  const DueChargeReduction({required this.value, required this.modality});

  Map<String, dynamic> toMap() => <String, dynamic>{
        'valorPerc': value.toStringAsFixed(2),
        'modalidade': modality.domain,
      };

  factory DueChargeReduction.fromMap(Map<String, dynamic> map) =>
      DueChargeReduction(
        value: map['valorPerc'] as double,
        modality: ReductionModality.match(map['modalidade'] as int),
      );

  String toJson() => json.encode(toMap());

  factory DueChargeReduction.fromJson(String source) =>
      DueChargeReduction.fromMap(json.decode(source) as Map<String, dynamic>);
}

enum ReductionModality {
  fixedValue(1),
  percentageValue(2);

  final int domain;

  const ReductionModality(this.domain);

  factory ReductionModality.match(int value) =>
      ReductionModality.values.firstWhere(
        (modality) => modality.domain == value,
        orElse: () => throw ArgumentError.value(value),
      );
}
