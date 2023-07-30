// ignore_for_file: public_member_api_docs

// Project imports:
import '../../../../config/utils/date_extensions.dart';
import '../../../../config/utils/map_extensions.dart';
import '../../../models/additional_info.dart';
import '../../../models/charge_status.dart';
import '../../models/debtor_details.dart';
import '../../models/due_charge_discount.dart';
import '../../models/due_charge_fine.dart';
import '../../models/due_charge_interest_rates.dart';
import '../../models/due_charge_reduction.dart';

class UpdateDueChargeRequestBody {
  final DateTime? dueDate;
  final DebtorDetails? debtorDetails;
  final double? originalValue;
  final String? pixKey;
  final int? expiryDaysAfterExpiration;
  final int? locationId;
  final ChargeStatus? status;
  final DueChargeFine? fine;
  final DueChargeInterestRate? interestRate;
  final DueChargeReduction? reduction;
  final DueChargeDiscount? discount;
  final String? payerSolicitation;
  final List<AdditionalInfo>? additionalInfo;

  const UpdateDueChargeRequestBody({
    required this.dueDate,
    required this.debtorDetails,
    required this.originalValue,
    required this.pixKey,
    required this.expiryDaysAfterExpiration,
    required this.locationId,
    required this.status,
    required this.fine,
    required this.interestRate,
    required this.reduction,
    required this.discount,
    required this.payerSolicitation,
    required this.additionalInfo,
  });

  Map<String, dynamic> toMap() {
    final body = <String, dynamic>{};

    final calendar = <String, dynamic>{}
      ..addIfNotNull('dataDeVencimento', dueDate?.toYearMonthDay())
      ..addIfNotNull('validadeAposVencimento', expiryDaysAfterExpiration);
    if (calendar.isNotEmpty) {
      body.addAll({
        'calendario': calendar,
      });
    }
    final value = <String, dynamic>{}
      ..addIfNotNull('original', originalValue?.toStringAsFixed(2))
      ..addIfNotNull('multa', fine?.toMap())
      ..addIfNotNull('juros', interestRate?.toMap())
      ..addIfNotNull('abatimento', reduction?.toMap())
      ..addIfNotNull('desconto', discount?.toMap());
    if (value.isNotEmpty) {
      body.addAll({
        'valor': value,
      });
    }
    if (locationId != null) {
      body.addAll({
        'loc': {
          'id': locationId,
        },
      });
    }
    body
      ..addIfNotNull('devedor', debtorDetails?.toMap())
      ..addIfNotNull('chave', pixKey)
      ..addIfNotNull('solicitacaoPagador', payerSolicitation)
      ..addIfNotNull(
        'infoAdicionais',
        additionalInfo?.map((e) => e.toMap()).toList(),
      );

    return body;
  }
}
