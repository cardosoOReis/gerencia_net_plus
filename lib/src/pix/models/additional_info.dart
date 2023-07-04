import 'dart:convert';

import 'package:equatable/equatable.dart';

class AdditionalInfo extends Equatable {
  final String name;
  final String value;
  const AdditionalInfo({
    required this.name,
    required this.value,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nome': name,
      'valor': value,
    };
  }

  factory AdditionalInfo.fromMap(Map<String, dynamic> map) {
    return AdditionalInfo(
      name: map['nome'] as String,
      value: map['valor'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AdditionalInfo.fromJson(String source) =>
      AdditionalInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object> get props => [name, value];
}
