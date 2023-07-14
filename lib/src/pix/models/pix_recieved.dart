// Dart imports:
import 'dart:convert';

// Project imports:
import '../../config/utils/date_extensions.dart';
import 'devolution.dart';

class PixRecieved {
  final String endToEndId;
  final String txid;
  final double value;
  final String pixKey;
  final DateTime paymentTime;
  final String? payerInfo;
  final List<Devolution>? devolutions;

  const PixRecieved({
    required this.endToEndId,
    required this.txid,
    required this.pixKey,
    required this.value,
    required this.paymentTime,
    this.payerInfo,
    this.devolutions,
  });

  Map<String, dynamic> toMap() => <String, dynamic>{
        'endToEndId': endToEndId,
        'txid': txid,
        'valor': value.toStringAsFixed(2),
        'chave': pixKey,
        'horario': paymentTime.toRFC3339(),
        'infoPagador': payerInfo,
        'devolucoes': devolutions?.map((d) => d.toMap()).toList(),
      };

  factory PixRecieved.fromMap(Map<String, dynamic> map) {
    List<dynamic>? devolutionJson = map['devolucoes'];
    List<Devolution>? devolutions;
    if (devolutionJson != null) {
      devolutions = devolutionJson
          .map((d) => Devolution.fromMap(d as Map<String, dynamic>))
          .toList();
    }

    return PixRecieved(
      endToEndId: map['endToEndId'] as String,
      txid: map['txid'] as String,
      value: double.parse(map['valor']),
      pixKey: map['chave'],
      paymentTime: DateTime.parse(map['horario']),
      payerInfo: map['infoPagador'],
      devolutions: devolutions,
    );
  }

  String toJson() => json.encode(toMap());

  factory PixRecieved.fromJson(String source) =>
      PixRecieved.fromMap(json.decode(source) as Map<String, dynamic>);
}
