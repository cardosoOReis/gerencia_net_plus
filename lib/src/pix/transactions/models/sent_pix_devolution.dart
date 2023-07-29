import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../../config/utils/date_extensions.dart';

class SentPixDevolution extends Equatable {
  final String rtrId;
  final double value;
  final DateTime time;

  const SentPixDevolution({
    required this.rtrId,
    required this.value,
    required this.time,
  });

  @override
  List<Object> get props => [];

  Map<String, dynamic> toMap() => <String, dynamic>{
        'rtrId': rtrId,
        'valor': value.toStringAsFixed(2),
        'time': time.toRFC3339(),
      };

  factory SentPixDevolution.fromMap(Map<String, dynamic> map) =>
      SentPixDevolution(
        rtrId: map['rtrId'] as String,
        value: double.parse(map['valor']),
        time: DateTime.parse(map['horario']),
      );

  String toJson() => json.encode(toMap());

  factory SentPixDevolution.fromJson(String source) =>
      SentPixDevolution.fromMap(json.decode(source) as Map<String, dynamic>);
}
