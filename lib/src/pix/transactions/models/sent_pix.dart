import 'package:equatable/equatable.dart';

import '../../../config/utils/date_extensions.dart';
import 'sent_pix_status.dart';

class SentPix extends Equatable {
  final String id;
  final String endToEndId;
  final double value;
  final DateTime solicitationTime;
  final SentPixStatus status;

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
