// Dart imports:

// Project imports:
import '../../config/utils/date_extensions.dart';
import 'devolution.dart';

/// Represents a received PIX transaction.
class RecievedPix {
  /// The end-to-end identifier of the received PIX transaction.
  final String endToEndId;

  /// The unique transaction identifier (txid) of the received PIX transaction.
  final String txid;

  /// The value (amount) of the received PIX transaction.
  final double value;

  /// The PIX key used for the received transaction.
  final String pixKey;

  /// The date and time when the payment was made for the received PIX
  /// transaction.
  final DateTime paymentTime;

  /// Information about the payer (if available) for the received PIX
  /// transaction.
  final String? payerInfo;

  /// A list of devolutions associated with the received PIX transaction, if
  /// applicable.
  final List<Devolution>? devolutions;

  /// Represents a received PIX transaction.
  const RecievedPix({
    required this.endToEndId,
    required this.txid,
    required this.pixKey,
    required this.value,
    required this.paymentTime,
    this.payerInfo,
    this.devolutions,
  });

  /// Handy method to convert a [RecievedPix] to a Map.
  Map<String, dynamic> toMap() => <String, dynamic>{
        'endToEndId': endToEndId,
        'txid': txid,
        'valor': value.toStringAsFixed(2),
        'chave': pixKey,
        'horario': paymentTime.toRFC3339(),
        'infoPagador': payerInfo,
        'devolucoes': devolutions?.map((d) => d.toMap()).toList(),
      };

  /// Handy method to convert a Map to a [RecievedPix].
  factory RecievedPix.fromMap(Map<String, dynamic> map) {
    List<dynamic>? devolutionJson = map['devolucoes'];
    List<Devolution>? devolutions;
    if (devolutionJson != null) {
      devolutions = devolutionJson
          .map((d) => Devolution.fromMap(d as Map<String, dynamic>))
          .toList();
    }

    return RecievedPix(
      endToEndId: map['endToEndId'] as String,
      txid: map['txid'] as String,
      value: double.parse(map['valor']),
      pixKey: map['chave'],
      paymentTime: DateTime.parse(map['horario']),
      payerInfo: map['infoPagador'],
      devolutions: devolutions,
    );
  }
}
