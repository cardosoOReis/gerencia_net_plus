// Package imports:
import 'package:equatable/equatable.dart';

// Project imports:
import '../../config/utils/date_extensions.dart';
import 'charge_type.dart';

/// Information about the location of a charge.
///
/// A [location] is a [capability URL](https://www.w3.org/TR/capability-urls/) that serves as an address for a charge.
/// In other words, it is through a location that it becomes possible to
/// retrieve the information related to a charge and, thus, perform the
/// transactions.
class LocationInfo extends Equatable {
  /// The location's unique id.
  final int id;

  /// The location's url.
  final String location;

  /// The type of charge this location refers to.
  final ChargeType chargeType;

  /// The creation's date of this location.
  final DateTime creationDate;

  /// Information about the location of a charge.
  ///
  /// A [location] is a [capability URL](https://www.w3.org/TR/capability-urls/) that serves as an address for a charge.
  /// In other words, it is through a location that it becomes possible to
  /// retrieve the information related to a charge and, thus, perform the
  /// transactions.
  const LocationInfo({
    required this.id,
    required this.location,
    required this.chargeType,
    required this.creationDate,
  });

  /// Handy method to convert a [LocationInfo] to a [Map].
  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'location': location,
        'tipoCob': chargeType,
        'criacao': creationDate.toRFC3339(),
      };

  /// Handy method to convert a [Map] to a [LocationInfo].
  factory LocationInfo.fromMap(Map<String, dynamic> map) => LocationInfo(
        id: map['id'] as int,
        location: map['location'] as String,
        chargeType: ChargeType.match(map['tipoCob'] as String),
        creationDate: DateTime.parse(map['criacao']),
      );

  @override
  List<Object> get props => [id, location, chargeType];
}
