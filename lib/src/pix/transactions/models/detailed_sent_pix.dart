// Package imports:
import 'package:equatable/equatable.dart';

// Project imports:
import '../../../config/utils/date_extensions.dart';
import 'payee_details.dart';
import 'sent_pix_devolution.dart';
import 'sent_pix_status.dart';

/// Represents a detailed sent PIX transaction.
class DetailedSentPix extends Equatable {
  /// The end-to-end identifier of the sent PIX transaction.
  final String endToEndId;

  /// The unique identifier of the sent PIX transaction.
  final String id;

  /// The value (amount) of the sent PIX transaction.
  final double value;

  /// The PIX key of the payer who initiated the transaction.
  final String payerPixKey;

  /// The status of the sent PIX transaction.
  final SentPixStatus status;

  /// The date and time when the PIX transaction was solicited.
  final DateTime solicitationTime;

  /// Details of the payee who received the PIX transaction.
  final PayeeDetails payeeDetails;

  /// The date and time when the PIX transaction was paid.
  ///
  /// This will only not be null when the [SentPixStatus] is
  /// [SentPixStatus.confirmed]
  final DateTime? liquidationTime;

  /// Additional information about the payer (if available) for the sent PIX
  /// transaction.
  final String? payerInfo;

  /// A list of devolutions associated with the sent PIX transaction, if
  /// applicable.
  final List<SentPixDevolution>? devolutions;

  /// Represents a detailed sent PIX transaction.
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

  /// Handy method to convert a [DetailedSentPix] to a Map.
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

  /// Handy method to convert a Map to a [DetailedSentPix].
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
