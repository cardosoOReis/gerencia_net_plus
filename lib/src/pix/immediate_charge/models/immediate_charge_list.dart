// Dart imports:
import 'dart:convert';

// Project imports:
import '../../models/pagination.dart';
import 'immediate_charge.dart';

class ImmediateChargeList {
  final Parameters parameters;
  final List<ImmediateCharge> charges;

  const ImmediateChargeList({
    required this.parameters,
    required this.charges,
  });

  Map<String, dynamic> toMap() => <String, dynamic>{
        'parametros': parameters.toMap(),
        'cobs': charges.map((x) => x.toMap()).toList(),
      };

  factory ImmediateChargeList.fromMap(Map<String, dynamic> map) =>
      ImmediateChargeList(
        parameters:
            Parameters.fromMap(map['parametros'] as Map<String, dynamic>),
        charges: List<ImmediateCharge>.from(
          (map['cobs'] as List<dynamic>).map<ImmediateCharge>(
            (x) => ImmediateCharge(
              x as Map<String, dynamic>,
            ),
          ),
        ),
      );

  String toJson() => json.encode(toMap());

  factory ImmediateChargeList.fromJson(String source) =>
      ImmediateChargeList.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );
}
