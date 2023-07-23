// Project imports:
import '../../models/charge_type.dart';
import '../../models/location_info.dart';

/// A normal [LocationInfo] but with a [txid] field.
///
/// Normally, when you recieve a [LocationInfo] from the GerenciaNet Api, it
/// doesn't have a [txid] associated with it. But in specific location
/// operations, it can return with a [txid]. With this in mind, this class can
/// cover those cases.
class LocationInfoWithTxid extends LocationInfo {
  /// The txid binded to this location.
  ///
  /// If the [txid] is null, the location doesn't have a txid associated with
  /// it.
  final String? txid;

  /// A normal [LocationInfo] but with a [txid] field.
  ///
  /// Normally, when you recieve a [LocationInfo] from the GerenciaNet Api, it
  /// doesn't have a [txid] associated with it. But in specific location
  /// operations, it can return with a [txid]. With this in mind, this class can
  /// cover those cases.
  const LocationInfoWithTxid({
    required super.id,
    required super.location,
    required super.chargeType,
    required super.creationDate,
    this.txid,
  });

  @override
  Map<String, dynamic> toMap() => super.toMap()..addAll({'txid': txid});

  /// Handy method to parse a LocationInfo with a txid from a map.
  @override
  factory LocationInfoWithTxid.fromMap(Map<String, dynamic> map) =>
      LocationInfoWithTxid(
        id: map['id'] as int,
        location: map['location'] as String,
        chargeType: ChargeType.match(map['tipoCob'] as String),
        creationDate: DateTime.parse(map['criacao']),
        txid: map['txid'],
      );
}
