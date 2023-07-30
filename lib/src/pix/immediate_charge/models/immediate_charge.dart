// Project imports:
import '../../../config/utils/date_extensions.dart';
import '../../models/additional_info.dart';
import '../../models/charge_status.dart';
import '../../models/location_info.dart';
import '../../models/recieved_pix.dart';
import 'debtor.dart';

/// Represents an immediate charge created for a PIX transaction.
class ImmediateCharge {
  /// The date and time when the immediate charge was created.
  final DateTime creation;

  /// The duration representing the expiration time of the immediate charge.
  final Duration expiration;

  /// The unique transaction identifier (txid) of the immediate charge.
  final String txid;

  /// The revision number of the immediate charge.
  final int revision;

  /// Information about the location where the immediate charge was created.
  final LocationInfo locationInfo;

  /// The status of the immediate charge.
  final ChargeStatus status;

  /// The value (amount) associated with the immediate charge.
  final double value;

  /// The PIX key associated with the immediate charge.
  final String pixKey;

  /// Information about the debtor associated with the immediate charge, if
  /// available.
  final Debtor? debtor;

  /// A solicitation message provided by the payer for the immediate charge, if
  /// available.
  final String? payerSolicitation;

  /// Additional information related to the immediate charge, if applicable.
  final List<AdditionalInfo>? additionalInfo;

  /// A list of received PIX transactions associated with the immediate charge,
  /// if available.
  final List<RecievedPix>? pixPayments;

  const ImmediateCharge._({
    required this.creation,
    required this.expiration,
    required this.txid,
    required this.revision,
    required this.locationInfo,
    required this.status,
    required this.pixKey,
    required this.value,
    this.debtor,
    this.payerSolicitation,
    this.additionalInfo,
    this.pixPayments,
  });

  /// Handy method to convert an [ImmediateCharge] to a Map.
  factory ImmediateCharge.fromMap(Map<String, dynamic> json) {
    final Map<String, dynamic>? debtorJson = json['devedor'];
    Debtor? debtor;
    if (debtorJson?.containsKey('cpf') ?? false) {
      debtor = PhysicalPersonDebtor(
        name: json['devedor']['nome'],
        cpf: json['devedor']['cpf'],
      );
    } else if (debtorJson?.containsKey('cnpj') ?? false) {
      debtor = LegalPersonDebtor(
        name: json['devedor']['nome'],
        cnpj: json['devedor']['cnpj'],
      );
    }

    List<dynamic>? additionalInfoJson = json['infoAdicionais'];
    List<AdditionalInfo>? additionalInfo;
    if (additionalInfoJson != null) {
      additionalInfo = additionalInfoJson
          .map((e) => AdditionalInfo.fromMap(e as Map<String, dynamic>))
          .toList();
    }

    List<dynamic>? pixJson = json['pix'];
    List<RecievedPix>? pix;
    if (pixJson != null) {
      pix = pixJson
          .map((p) => RecievedPix.fromMap(p as Map<String, dynamic>))
          .toList();
    }

    return ImmediateCharge._(
      creation: DateTime.parse(json['calendario']['criacao'].toString()),
      expiration: Duration(milliseconds: json['calendario']['expiracao']),
      txid: json['txid'],
      revision: json['revisao'],
      locationInfo: LocationInfo.fromMap(json['loc']),
      status: ChargeStatus.match(json['status']),
      debtor: debtor,
      payerSolicitation: json['solicitacaoPagador'],
      pixKey: json['chave'],
      value: double.parse(json['valor']['original']),
      additionalInfo: additionalInfo,
      pixPayments: pix,
    );
  }

  /// Handy method to convert a Map to an [ImmediateCharge].
  Map<String, dynamic> toMap() => <String, dynamic>{
        'creation': creation.toRFC3339(),
        'expiration': expiration.inSeconds,
        'txid': txid,
        'revisionAmount': revision,
        'locationInfo': locationInfo.toMap(),
        'status': status.value,
        'value': value,
        'debtor': debtor?.toMap(),
        'pixKey': pixKey,
        'payerSolicitation': payerSolicitation,
        'additionalInfo': additionalInfo?.map((e) => e.toMap()).toList(),
        'pix': pixPayments?.map((p) => p.toMap()).toList(),
      };
}
