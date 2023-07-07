// Dart imports:
import 'dart:convert';

// Project imports:
import '../../models/pagination.dart';
import 'pix_immediate_charge.dart';

class PixImmediateChargeList {
  final Parameters parameters;
  final List<PixImmediateCharge> charges;

  const PixImmediateChargeList({
    required this.parameters,
    required this.charges,
  });

  Map<String, dynamic> toMap() => <String, dynamic>{
        'parametros': parameters.toMap(),
        'cobs': charges.map((x) => x.toMap()).toList(),
      };

  factory PixImmediateChargeList.fromMap(Map<String, dynamic> map) =>
      PixImmediateChargeList(
        parameters:
            Parameters.fromMap(map['parametros'] as Map<String, dynamic>),
        charges: List<PixImmediateCharge>.from(
          (map['cobs'] as List<dynamic>).map<PixImmediateCharge>(
            (x) => PixImmediateCharge(
              x as Map<String, dynamic>,
            ),
          ),
        ),
      );

  String toJson() => json.encode(toMap());

  factory PixImmediateChargeList.fromJson(String source) =>
      PixImmediateChargeList.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );
}
