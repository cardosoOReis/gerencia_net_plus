// Project imports:
import '../../models/pagination.dart';
import 'location_with_txid.dart';

/// Represents a paginated list of location information.
///
/// This class contains information about a list of locations and implements
/// pagination to retrieve multiple locations in a paginated format. It includes
/// properties such as the [parameters] used for pagination and the [locations]
/// list that holds individual [LocationInfoWithTxid] objects.
class LocationInfoPagination {
  /// The parameters used for pagination.
  final Parameters parameters;

  /// The list of locations with associated transaction identifiers.
  final List<LocationInfoWithTxid> locations;

  /// Represents a paginated list of location information.
  ///
  /// This class contains information about a list of locations and implements
  /// pagination to retrieve multiple locations in a paginated format. It
  /// includes properties such as the [parameters] used for pagination and the
  /// [locations] list that holds individual [LocationInfoWithTxid] objects.
  const LocationInfoPagination({
    required this.parameters,
    required this.locations,
  });

  /// Handy method to convert a [LocationInfoPagination] to a Map.
  Map<String, dynamic> toMap() => <String, dynamic>{
        'parametros': parameters.toMap(),
        'loc': locations.map((x) => x.toMap()).toList(),
      };

  /// Handy method to convert a Map to a [LocationInfoPagination].
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
