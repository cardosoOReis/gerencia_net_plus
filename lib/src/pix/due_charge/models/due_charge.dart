// Project imports:
import '../../../config/utils/date_extensions.dart';
import '../../../config/utils/map_extensions.dart';
import '../../models/additional_info.dart';
import '../../models/charge_status.dart';
import '../../models/location_info.dart';
import 'debtor_details.dart';
import 'due_charge_discount.dart';
import 'due_charge_fine.dart';
import 'due_charge_interest_rates.dart';
import 'due_charge_reduction.dart';
import 'reciever_details.dart';

class DueCharge {
  final DateTime creationDate;
  final DateTime dueDate;
  final int validDaysAfterExpiration;
  final String txid;
  final int revison;
  final ChargeStatus status;
  final DebtorDetails debtorDetails;
  final RecieverDetails recieverDetails;
  final double originalValue;
  final String pixKey;
  final LocationInfo? locationInfo;
  final DueChargeInterestRate? interestRate;
  final DueChargeFine? fine;
  final DueChargeReduction? reduction;
  final DueChargeDiscount? discount;
  final String? payerSolicitation;
  final List<AdditionalInfo>? additionalInfo;

  const DueCharge({
    required this.creationDate,
    required this.dueDate,
    required this.validDaysAfterExpiration,
    required this.txid,
    required this.revison,
    required this.locationInfo,
    required this.status,
    required this.debtorDetails,
    required this.recieverDetails,
    required this.originalValue,
    required this.pixKey,
    this.interestRate,
    this.fine,
    this.reduction,
    this.discount,
    this.payerSolicitation,
    this.additionalInfo,
  });

  Map<String, dynamic> toMap() => <String, dynamic>{
        'calendario': {
          'criacao': creationDate.toRFC3339(),
          'dataDeVencimento': dueDate.toYearMonthDay(),
          'validadeAposVencimento': validDaysAfterExpiration,
        },
        'txid': txid,
        'revisao': revison,
        'loc': locationInfo?.toMap(),
        'status': status.value,
        'devedor': debtorDetails.toMap(),
        'recebedor': recieverDetails.toMap(),
        'chave': pixKey,
        'valor': <String, dynamic>{
          'original': originalValue.toStringAsFixed(2),
        }
          ..addIfNotNull('juros', interestRate?.toMap())
          ..addIfNotNull('multa', fine?.toMap())
          ..addIfNotNull('abatimento', reduction?.toMap())
          ..addIfNotNull('desconto', discount?.toMap()),
        'payerSolicitation': payerSolicitation,
        'additionalInfo': additionalInfo?.map((x) => x.toMap()).toList(),
      };

  factory DueCharge.fromMap(Map<String, dynamic> map) {
    final calendarMap = map['calendario'] as Map<String, dynamic>;
    final debtorMap = map['devedor'] as Map<String, dynamic>;
    final debtorDetails = debtorMap.containsKey('cnpj')
        ? LegalDebtorDetails.fromMap(debtorMap)
        : PhysicalDebtorDetails.fromMap(debtorMap);
    final valueMap = map['valor'] as Map<String, dynamic>;
    final interestRate = valueMap.containsKey('juros')
        ? DueChargeInterestRate.fromMap(valueMap['juros'])
        : null;
    final fine = valueMap.containsKey('multa')
        ? DueChargeFine.fromMap(valueMap['multa'])
        : null;
    final reduction = valueMap.containsKey('abatimento')
        ? DueChargeReduction.fromMap(valueMap['abatimento'])
        : null;
    final discount = valueMap.containsKey('desconto')
        ? DueChargeDiscount.fromMap(valueMap['desconto'])
        : null;

    return DueCharge(
      creationDate: DateTime.parse(calendarMap['criacao']),
      dueDate: DateTime.parse(calendarMap['dataDeVencimento']),
      validDaysAfterExpiration: calendarMap['validadeAposVencimento'],
      txid: map['txid'],
      revison: map['revisao'],
      locationInfo: LocationInfo.fromMap(map['loc']),
      status: ChargeStatus.match(map['status']),
      debtorDetails: debtorDetails,
      recieverDetails: RecieverDetails.fromMap(map['recebedor']),
      originalValue: double.parse(valueMap['original']),
      pixKey: map['chave'],
      interestRate: interestRate,
      fine: fine,
      reduction: reduction,
      discount: discount,
      payerSolicitation: map['solicitacaoPagador'],
      additionalInfo: map.containsKey('infoAdicionais')
          ? List<AdditionalInfo>.from(
              map['infoAdicionais'].map(
                (x) => AdditionalInfo.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }
}
