// Dart imports:
import 'dart:convert';

// Project imports:
import '../../../config/utils/date_extensions.dart';
import '../../models/additional_info.dart';
import 'debtor.dart';
import '../../models/location_info.dart';
import '../../models/pix_payment.dart';
import '../../models/pix_status.dart';

class PixImmediateCharge {
  final DateTime creation;
  final Duration expiration;
  final String txid;
  final int revisionAmount;
  final LocationInfo locationInfo;
  final PixStatus status;
  final double value;
  final String pixKey;
  final Debtor? debtor;
  final String? payerSolicitation;
  final List<AdditionalInfo>? additionalInfo;
  final List<PixPayment>? pixPayment;

  const PixImmediateCharge._({
    required this.creation,
    required this.expiration,
    required this.txid,
    required this.revisionAmount,
    required this.locationInfo,
    required this.status,
    required this.pixKey,
    required this.value,
    this.debtor,
    this.payerSolicitation,
    this.additionalInfo,
    this.pixPayment,
  });

  factory PixImmediateCharge(Map<String, dynamic> json) {
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
    List<PixPayment>? pix;
    if (pixJson != null) {
      pix = pixJson
          .map((p) => PixPayment.fromMap(p as Map<String, dynamic>))
          .toList();
    }

    return PixImmediateCharge._(
      creation: DateTime.parse(json['calendario']['criacao'].toString()),
      expiration: Duration(milliseconds: json['calendario']['expiracao']),
      txid: json['txid'],
      revisionAmount: json['revisao'],
      locationInfo: LocationInfo(
        id: json['loc']['id'],
        location: json['loc']['location'],
        chargeType: json['loc']['tipoCob'],
      ),
      status: PixStatus.match(json['status']),
      debtor: debtor,
      payerSolicitation: json['solicitacaoPagador'],
      pixKey: json['chave'],
      value: double.parse(json['valor']['original']),
      additionalInfo: additionalInfo,
      pixPayment: pix,
    );
  }

  Map<String, dynamic> toMap() => <String, dynamic>{
        'creation': creation.toRFC3339(),
        'expiration': expiration.inMilliseconds,
        'txid': txid,
        'revisionAmount': revisionAmount,
        'locationInfo': locationInfo.toMap(),
        'status': status.name,
        'value': value,
        'debtor': debtor?.toMap(),
        'pixKey': pixKey,
        'payerSolicitation': payerSolicitation,
        'additionalInfo': additionalInfo?.map((e) => e.toMap()).toList(),
        'pix': pixPayment?.map((p) => p.toMap()).toList(),
      };

  String toJson() => json.encode(toMap());

  factory PixImmediateCharge.fromJson(String source) =>
      PixImmediateCharge(json.decode(source) as Map<String, dynamic>);
}
