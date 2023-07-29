// Dart imports:

// Project imports:
import '../../../models/pagination.dart';
import '../../models/location_with_txid.dart';

class LocationInfoPagination {
  final Parameters parameters;
  final List<LocationInfoWithTxid> locations;

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
        locations: List<LocationInfoWithTxid>.from(
          (map['loc'] as List<dynamic>).map(
            (x) => LocationInfoWithTxid.fromMap(x as Map<String, dynamic>),
          ),
        ),
      );
}
