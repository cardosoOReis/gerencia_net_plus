// ignore_for_file: public_member_api_docs

// Project imports:
import '../../../../config/utils/date_extensions.dart';
import '../../../../config/utils/map_extensions.dart';
import '../../../models/additional_info.dart';
import '../../models/debtor_details.dart';
import '../../models/due_charge_discount.dart';
import '../../models/due_charge_fine.dart';
import '../../models/due_charge_interest_rates.dart';
import '../../models/due_charge_reduction.dart';

class CreateDueChargeRequestBody {
  final DateTime dueDate;
  final DebtorDetails debtorDetails;
  final double originalValue;
  final String pixKey;
  final int? expiryDaysAfterExpiration;
  final int? locationId;
  final DueChargeFine? fine;
  final DueChargeInterestRate? interestRate;
  final DueChargeReduction? reduction;
  final DueChargeDiscount? discount;
  final String? payerSolicitation;
  final List<AdditionalInfo> additionalInfo;

  const CreateDueChargeRequestBody({
    required this.dueDate,
    required this.debtorDetails,
    required this.originalValue,
    required this.pixKey,
    required this.expiryDaysAfterExpiration,
    required this.locationId,
    required this.fine,
    required this.interestRate,
    required this.reduction,
    required this.discount,
    required this.payerSolicitation,
    this.additionalInfo = const [],
  });

  Map<String, dynamic> toMap() {
    final body = <String, dynamic>{
      'calendario': <String, dynamic>{
        'dataDeVencimento': dueDate.toYearMonthDay(),
      }..addIfNotNull('validadeAposVencimento', expiryDaysAfterExpiration),
      'devedor': debtorDetails.toMap(),
      'valor': <String, dynamic>{
        'original': originalValue.toStringAsFixed(2),
      }
        ..addIfNotNull('multa', fine?.toMap())
        ..addIfNotNull('juros', interestRate?.toMap())
        ..addIfNotNull('abatimento', reduction?.toMap())
        ..addIfNotNull('desconto', discount?.toMap()),
      'chave': pixKey,
    }..addIfNotNull('solicitacaoPagador', payerSolicitation);

    if (locationId != null) {
      body.addAll({
        'loc': {
          'id': locationId,
        },
      });
    }
    if (additionalInfo.isNotEmpty) {
      body.addAll({
        'infoAdicionais': additionalInfo.map((e) => e.toMap()).toList(),
      });
    }

    return body;
  }
}
