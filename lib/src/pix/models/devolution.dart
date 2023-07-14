// Dart imports:
import 'dart:convert';

class Devolution {
  final String id;
  final String rtrId;
  final double value;
  final DateTime solicitationTime;
  final DevolutionStatus status;
  const Devolution({
    required this.id,
    required this.rtrId,
    required this.value,
    required this.solicitationTime,
    required this.status,
  });

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'rtrId': rtrId,
        'valor': value,
        'horario': {
          'solicitacao': solicitationTime.millisecondsSinceEpoch,
        },
        'status': status.value,
      };

  factory Devolution.fromMap(Map<String, dynamic> map) => Devolution(
        id: map['id'] as String,
        rtrId: map['rtrId'] as String,
        value: map['value'] as double,
        solicitationTime: DateTime.parse(map['horario']['solicitacao']),
        status: DevolutionStatus.match(map['status']),
      );

  String toJson() => json.encode(toMap());

  factory Devolution.fromJson(String source) =>
      Devolution.fromMap(json.decode(source) as Map<String, dynamic>);
}

enum DevolutionStatus {
  processing('EM_PROCESSAMENTO'),
  returned('DEVOLVIDO'),
  unrealized('NAO_REALIZADO');

  final String value;

  const DevolutionStatus(this.value);

  factory DevolutionStatus.match(String value) =>
      DevolutionStatus.values.firstWhere(
        (status) => status.value == value,
        orElse: () => throw ArgumentError.value(value),
      );
}
