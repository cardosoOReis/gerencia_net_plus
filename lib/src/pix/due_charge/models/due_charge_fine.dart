// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:equatable/equatable.dart';

class DueChargeFine extends Equatable {
  final double value;
  final DueChargeFineModality modality;

  const DueChargeFine({required this.value, required this.modality});

  @override
  List<Object?> get props => [value, modality];

  Map<String, dynamic> toMap() => <String, dynamic>{
        'valorPerc': value.toStringAsFixed(2),
        'modalidade': modality.domain,
      };

  factory DueChargeFine.fromMap(Map<String, dynamic> map) => DueChargeFine(
        value: double.parse(map['valorPerc']),
        modality: DueChargeFineModality.match(map['modalidade']),
      );

  String toJson() => json.encode(toMap());

  factory DueChargeFine.fromJson(String source) =>
      DueChargeFine.fromMap(json.decode(source) as Map<String, dynamic>);

  DueChargeFine copyWith({
    double? value,
    DueChargeFineModality? modality,
  }) =>
      DueChargeFine(
        value: value ?? this.value,
        modality: modality ?? this.modality,
      );
}

enum DueChargeFineModality {
  fixedValue(1),
  percentageValue(2);

  final int domain;

  const DueChargeFineModality(this.domain);

  factory DueChargeFineModality.match(int value) =>
      DueChargeFineModality.values.firstWhere(
        (modality) => modality.domain == value,
        orElse: () => throw ArgumentError.value(value),
      );
}
