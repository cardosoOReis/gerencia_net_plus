import '../../config/utils/date_extensions.dart';
import '../../config/utils/map_extensions.dart';

/// Represents a devolution made from a [RecievedPix].
class Devolution {
  /// Client-generated ID to uniquely represent a devolution.
  final String id;

  /// The devolution's identifier.
  final String rtrId;

  /// The devolution's value.
  ///
  /// The devolution's value can't be higher then the [RecievedPix] value.
  final double value;

  /// When the devolution was solicitaded.
  final DateTime solicitationTime;

  /// The current devolution's status.
  final DevolutionStatus status;

  /// The reason the devolution was not made.
  ///
  /// This field will only be not null when [status] is
  /// [DevolutionStatus.rejected]
  final String? reason;

  /// Represents a devolution made from a [RecievedPix].
  const Devolution({
    required this.id,
    required this.rtrId,
    required this.value,
    required this.solicitationTime,
    required this.status,
    this.reason,
  });

  /// Handy method to convert a [Devolution] to a [Map].
  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'rtrId': rtrId,
        'valor': value,
        'horario': {
          'solicitacao': solicitationTime.toRFC3339(),
        },
        'status': status.value,
      }..addIfNotNull('motivo', reason);

  /// Handy method to convert a [Map] to a [Devolution].
  factory Devolution.fromMap(Map<String, dynamic> map) => Devolution(
        id: map['id'] as String,
        rtrId: map['rtrId'] as String,
        value: double.parse(map['valor']),
        solicitationTime: DateTime.parse(map['horario']['solicitacao']),
        status: DevolutionStatus.match(map['status']),
        reason: map['motivo'],
      );
}

/// The devolution's status.
///
/// - [processing]: The devolution is still being processed, and has not been
/// made yet.
///
/// - [confirmed]: The devolution was made.
///
/// - [rejected]: The devolution was not made, and it won't be made.
enum DevolutionStatus {
  /// The devolution is still being processed, and has not been made yet.
  processing('EM_PROCESSAMENTO'),

  ///The devolution was made.
  confirmed('DEVOLVIDO'),

  /// The devolution was not made, and it won't be made.
  rejected('NAO_REALIZADO');

  /// The status that is returned from the GerenciaNet Api.
  final String value;

  const DevolutionStatus(this.value);

  factory DevolutionStatus.match(String value) =>
      DevolutionStatus.values.firstWhere(
        (status) => status.value == value,
        orElse: () => throw ArgumentError.value(value),
      );
}
