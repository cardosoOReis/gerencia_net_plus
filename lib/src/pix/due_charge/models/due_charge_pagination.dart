// Dart imports:
import 'dart:convert';

// Project imports:
import '../../models/pagination.dart';
import 'due_charge.dart';

class DueChargePagination {
  final Parameters parameters;
  final List<DueCharge> dueCharges;

  const DueChargePagination({
    required this.parameters,
    required this.dueCharges,
  });

  Map<String, dynamic> toMap() => <String, dynamic>{
        'parametros': parameters.toMap(),
        'cobs': dueCharges.map((x) => x.toMap()).toList(),
      };

  factory DueChargePagination.fromMap(Map<String, dynamic> map) =>
      DueChargePagination(
        parameters: Parameters.fromMap(map['parametros']),
        dueCharges: List<DueCharge>.from(
          map['cobs'].map<DueCharge>(
            (x) => DueCharge.fromMap(x as Map<String, dynamic>),
          ),
        ),
      );

  String toJson() => json.encode(toMap());

  factory DueChargePagination.fromJson(String source) =>
      DueChargePagination.fromMap(json.decode(source) as Map<String, dynamic>);
}
