// Dart imports:

// Project imports:
import '../../models/pagination.dart';
import 'immediate_charge.dart';

/// Represents a paginated list of Immediate Charges.
///
/// This class contains information about a list of immediate charges and
/// implements pagination to retrieve multiple immediate charges in a paginated
/// format. It includes properties such as the [parameters] used for pagination
/// and the [charges] list that holds individual [ImmediateCharge] objects.
class ImmediateChargePagination {
  /// The parameters used for pagination.
  final Parameters parameters;

  /// The list of Immediate Charges in this pagination result.
  final List<ImmediateCharge> charges;

  /// Represents a paginated list of Immediate Charges.
  ///
  /// This class contains information about a list of immediate charges and
  /// implements pagination to retrieve multiple immediate charges in a
  /// paginated format. It includes properties such as the [parameters] used for
  /// pagination and the [charges] list that holds individual [ImmediateCharge]
  /// objects.
  const ImmediateChargePagination({
    required this.parameters,
    required this.charges,
  });

  /// Handy method to convert an [ImmediateCharge] to a Map.
  Map<String, dynamic> toMap() => <String, dynamic>{
        'parametros': parameters.toMap(),
        'cobs': charges.map((x) => x.toMap()).toList(),
      };

  /// Handy method to convert a Map to an [ImmediateCharge].
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
