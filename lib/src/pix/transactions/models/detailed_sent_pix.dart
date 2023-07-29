import 'package:equatable/equatable.dart';

import '../../../config/utils/date_extensions.dart';
import 'payee_details.dart';
import 'sent_pix_devolution.dart';
import 'sent_pix_status.dart';

class DetailedSentPix extends Equatable {
  final String endToEndId;
  final String id;
  final double value;
  final String payerPixKey;
  final SentPixStatus status;
  final DateTime solicitationTime;
  final PayeeDetails payeeDetails;
  final DateTime? liquidationTime;
  final String? payerInfo;
  final List<SentPixDevolution>? devolutions;

  const DetailedSentPix({
    required this.endToEndId,
    required this.id,
    required this.value,
    required this.payerPixKey,
    required this.status,
    required this.solicitationTime,
    required this.payeeDetails,
    this.liquidationTime,
    this.payerInfo,
    this.devolutions,
  });

  @override
  List<Object?> get props => [
        endToEndId,
        id,
        value,
        payerPixKey,
        status,
        payerInfo,
        solicitationTime,
        liquidationTime,
        payeeDetails,
      ];

  Map<String, dynamic> toMap() => <String, dynamic>{
        'endToEndId': endToEndId,
        'id': id,
        'value': value,
        'payerPixKey': payerPixKey,
        'status': status.value,
        'solicitationTime': solicitationTime.toRFC3339(),
        'payeeDetails': payeeDetails.toMap(),
        'liquidationTime': liquidationTime?.toRFC3339(),
        'payerInfo': payerInfo,
        'devolutions': devolutions?.map((e) => e.toMap()).toList(),
      };

  factory DetailedSentPix.fromMap(Map<String, dynamic> map) {
    final Map<String, dynamic> payeeJson = map['favorecido'];
    final payeeDetails = payeeJson.containsKey('chave')
        ? PixKeyPayeeDetails(pixKey: payeeJson['chave'])
        : BankAccountPayeeDetails.fromMap(payeeJson['contaBanco']);

    return DetailedSentPix(
      endToEndId: map['endToEndId'] as String,
      id: map['idEnvio'] as String,
      value: double.parse(map['valor']),
      payerPixKey: map['chave'] as String,
      status: SentPixStatus.match(map['status']),
      solicitationTime: DateTime.parse(map['horario']['solicitacao']),
      liquidationTime: DateTime.tryParse(map['horario']['liquidacao'] ?? ''),
      payeeDetails: payeeDetails,
      payerInfo: map['infoPagador'],
      devolutions: (map['devolucoes'] as List<dynamic>?)
          ?.map((e) => SentPixDevolution.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
