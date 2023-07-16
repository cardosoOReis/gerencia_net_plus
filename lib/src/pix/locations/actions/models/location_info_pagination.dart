// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../../models/location_info.dart';
import '../../../models/pagination.dart';

class LocationInfoPagination {
  final Parameters parameters;
  final List<LocationInfo> locations;

  const LocationInfoPagination({
    required this.parameters,
    required this.locations,
  });

  Map<String, dynamic> toMap() => <String, dynamic>{
        'parametros': parameters.toMap(),
        'loc': locations.map((x) => x.toMap()).toList(),
      };

  factory LocationInfoPagination.fromMap(Map<String, dynamic> map) =>
      LocationInfoPagination(
        parameters: Parameters.fromMap(map['parametros']),
        locations: List<LocationInfo>.from(
          (map['loc'] as List<dynamic>).map(
            (x) => LocationInfo.fromMap(x as Map<String, dynamic>),
          ),
        ),
      );

  String toJson() => json.encode(toMap());

  factory LocationInfoPagination.fromJson(String source) =>
      LocationInfoPagination.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );
}
