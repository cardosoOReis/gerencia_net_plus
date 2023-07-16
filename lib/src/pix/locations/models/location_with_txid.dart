// Project imports:
import '../../models/charge_type.dart';
import '../../models/location_info.dart';

class LocationInfoWithTxid extends LocationInfo {
  final String? txid;

  const LocationInfoWithTxid({
    required super.id,
    required super.location,
    required super.chargeType,
    required super.creationDate,
    this.txid,
  });

  @override
  Map<String, dynamic> toMap() => super.toMap()..addAll({'txid': txid});

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
