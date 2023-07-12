// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:equatable/equatable.dart';

class AdditionalInfo extends Equatable {
  final String name;
  final String value;
  const AdditionalInfo({
    required this.name,
    required this.value,
  });

  Map<String, dynamic> toMap() => <String, dynamic>{
        'nome': name,
        'valor': value,
      };

  factory AdditionalInfo.fromMap(Map<String, dynamic> map) => AdditionalInfo(
        name: map['nome'] as String,
        value: map['valor'] as String,
      );

  String toJson() => json.encode(toMap());

  factory AdditionalInfo.fromJson(String source) =>
      AdditionalInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object> get props => [name, value];

  AdditionalInfo copyWith({
    String? name,
    String? value,
  }) =>
      AdditionalInfo(
        name: name ?? this.name,
        value: value ?? this.value,
      );
}
