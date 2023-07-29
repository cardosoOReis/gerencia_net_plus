// Dart imports:

// Project imports:
import '../../models/pagination.dart';
import 'immediate_charge.dart';

class ImmediateChargePagination {
  final Parameters parameters;
  final List<ImmediateCharge> charges;

  const ImmediateChargePagination({
    required this.parameters,
    required this.charges,
  });

  Map<String, dynamic> toMap() => <String, dynamic>{
        'parametros': parameters.toMap(),
        'cobs': charges.map((x) => x.toMap()).toList(),
      };

  factory ImmediateChargePagination.fromMap(Map<String, dynamic> map) =>
      ImmediateChargePagination(
        parameters:
            Parameters.fromMap(map['parametros'] as Map<String, dynamic>),
        charges: List<ImmediateCharge>.from(
          (map['cobs'] as List<dynamic>).map<ImmediateCharge>(
            (x) => ImmediateCharge.fromMap(
              x as Map<String, dynamic>,
            ),
          ),
        ),
      );
}
