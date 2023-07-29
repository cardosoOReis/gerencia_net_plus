// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import '../../../config/http_client/gerencia_net_plus_pix_rest_client.dart';
import '../../../core/gerencia_net_exception.dart';
import '../../models/additional_info.dart';
import '../models/debtor_details.dart';
import '../models/due_charge.dart';
import '../models/due_charge_discount.dart';
import '../models/due_charge_fine.dart';
import '../models/due_charge_interest_rates.dart';
import '../models/due_charge_reduction.dart';
import 'models/create_due_charge_request_body.dart';

/// Creates a Due Charge with the given [originalValue].
class CreateDueCharge {
  final GerenciaNetPlusPixRestClient _client;

  /// Creates a Due Charge with the given [originalValue].
  const CreateDueCharge(this._client);

  Future<DueCharge> call({
    required DateTime dueDate,
    required DebtorDetails debtorDetails,
    required double originalValue,
    required String pixKey,
    required String txid,
    required int? expiryDaysAfterExpiration,
    required int? locationId,
    required DueChargeFine? fine,
    required DueChargeInterestRate? interestRate,
    required DueChargeReduction? reduction,
    required DueChargeDiscount? discount,
    required String? payerSolicitation,
    List<AdditionalInfo> additionalInfo = const [],
  }) async {
    final body = CreateDueChargeRequestBody(
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
    ).toMap();

    final endPoint = _client.pixEndPoints.dueCharge.createDueCharge(txid);

    try {
      final response = await _client<Map<String, dynamic>>(
        endPoint: endPoint,
        body: body,
      );

      return DueCharge.fromMap(response.data!);
    } on DioException catch (e, s) {
      throw GerenciaNetException(
        title: e.response?.data['title'],
        message: e.response?.data['detail'],
        statusCode: e.response?.data['status'] ?? e.response?.statusCode,
        originalException: e,
        stackTrace: s,
      );
    }
  }
}
