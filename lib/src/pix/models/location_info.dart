// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:equatable/equatable.dart';

import '../../config/utils/date_extensions.dart';

class LocationInfo extends Equatable {
  final int id;
  final String location;
  final String chargeType;
  final DateTime creationDate;

  const LocationInfo({
    required this.id,
    required this.location,
    required this.chargeType,
    required this.creationDate,
  });

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'location': location,
        'tipoCob': chargeType,
        'criacao': creationDate.toRFC3339(),
      };

  factory LocationInfo.fromMap(Map<String, dynamic> map) => LocationInfo(
        id: map['id'] as int,
        location: map['location'] as String,
        chargeType: map['tipoCob'] as String,
        creationDate: DateTime.parse(map['criacao']),
      );

  String toJson() => json.encode(toMap());

  factory LocationInfo.fromJson(String source) =>
      LocationInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object> get props => [id, location, chargeType];
}
