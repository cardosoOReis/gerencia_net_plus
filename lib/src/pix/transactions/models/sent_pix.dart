// Package imports:
import 'package:equatable/equatable.dart';

// Project imports:
import '../../../config/utils/date_extensions.dart';
import 'sent_pix_status.dart';

/// Represents a sent Pix transaction.
class SentPix extends Equatable {
  /// The unique identifier of the sent Pix transaction.
  final String id;

  /// The end-to-end identifier of the sent Pix transaction.
  final String endToEndId;

  /// The value of the sent Pix transaction.
  final double value;

  /// The date and time when the Pix transaction was solicited.
  final DateTime solicitationTime;

  /// The status of the sent Pix transaction.
  final SentPixStatus status;

  /// Represents a sent Pix transaction.
  const SentPix({
    required this.id,
    required this.endToEndId,
    required this.value,
    required this.solicitationTime,
    required this.status,
  });

  @override
  List<Object> get props => [
        id,
        endToEndId,
        value,
        solicitationTime,
        status,
      ];

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'endToEndId': endToEndId,
        'value': value,
        'solicitationTime': solicitationTime.toRFC3339(),
        'status': status.value,
      };

  factory SentPix.fromMap(Map<String, dynamic> map) => SentPix(
        id: map['idEnvio'] as String,
        endToEndId: map['e2eId'] ?? map['endToEndId'],
        value: double.parse(map['valor']),
        solicitationTime: DateTime.parse(map['horario']['solicitacao']),
        status: SentPixStatus.match(map['status']),
      );
}
