import '../../../config/http_client/gerencia_net_plus_pix_rest_client.dart';
import '../../models/additional_info.dart';
import '../models/debtor_details.dart';
import '../models/due_charge.dart';
import '../models/due_charge_discount.dart';
import '../models/due_charge_fine.dart';
import '../models/due_charge_interest_rates.dart';
import '../models/due_charge_reduction.dart';
import 'models/update_due_charge_request_body.dart';

class UpdateDueCharge {
  final GerenciaNetPlusPixRestClient _client;

  const UpdateDueCharge(this._client);

  Future<DueCharge> call(
    String txid, {
    required DateTime? dueDate,
    required DebtorDetails? debtorDetails,
    required double? originalValue,
    required String? pixKey,
    required int? expiryDaysAfterExpiration,
    required int? locationId,
    required DueChargeFine? fine,
    required DueChargeInterestRate? interestRate,
    required DueChargeReduction? reduction,
    required DueChargeDiscount? discount,
    required String? payerSolicitation,
    required List<AdditionalInfo>? additionalInfo,
  }) async {
    final body = UpdateDueChargeRequestBody(
      dueDate: dueDate,
      debtorDetails: debtorDetails,
      originalValue: originalValue,
      pixKey: pixKey,
      expiryDaysAfterExpiration: expiryDaysAfterExpiration,
      locationId: locationId,
      fine: fine,
      interestRate: interestRate,
      reduction: reduction,
      discount: discount,
      payerSolicitation: payerSolicitation,
      additionalInfo: additionalInfo,
    );

    final endPoint = _client.pixEndPoints.dueCharge.updateDueCharge(txid);

    final response = await _client<Map<String, dynamic>>(
      endPoint: endPoint,
      body: body.toMap(),
    );

    return DueCharge.fromMap(response.data!);
  }
}
