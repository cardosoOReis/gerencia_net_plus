// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:equatable/equatable.dart';

class LocationInfo extends Equatable {
  final int id;
  final String location;
  final String chargeType;

  const LocationInfo({
    required this.id,
    required this.location,
    required this.chargeType,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'location': location,
      'chargeType': chargeType,
    };
  }

  factory LocationInfo.fromMap(Map<String, dynamic> map) {
    return LocationInfo(
      id: map['id'] as int,
      location: map['location'] as String,
      chargeType: map['chargeType'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LocationInfo.fromJson(String source) =>
      LocationInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object> get props => [id, location, chargeType];
}
