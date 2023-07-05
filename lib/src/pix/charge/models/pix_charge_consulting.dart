// Dart imports:
import 'dart:convert';

// Project imports:
import '../../models/pagination.dart';
import 'pix_charge.dart';

class PixChargeList {
  final Parameters parameters;
  final List<PixCharge> charges;

  const PixChargeList({
    required this.parameters,
    required this.charges,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'parametros': parameters.toMap(),
      'cobs': charges.map((x) => x.toMap()).toList(),
    };
  }

  factory PixChargeList.fromMap(Map<String, dynamic> map) {
    return PixChargeList(
      parameters: Parameters.fromMap(map['parametros'] as Map<String, dynamic>),
      charges: List<PixCharge>.from(
        (map['cobs'] as List<dynamic>).map<PixCharge>(
          (x) => PixCharge(
            x as Map<String, dynamic>,
          ),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory PixChargeList.fromJson(String source) =>
      PixChargeList.fromMap(json.decode(source) as Map<String, dynamic>);
}
