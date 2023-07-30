// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import '../../../config/http_client/gerencia_net_plus_pix_rest_client.dart';
import '../../../core/gerencia_net_exception.dart';
import '../../models/additional_info.dart';
import '../../models/charge_status.dart';
import '../models/debtor_details.dart';
import '../models/due_charge.dart';
import '../models/due_charge_discount.dart';
import '../models/due_charge_fine.dart';
import '../models/due_charge_interest_rates.dart';
import '../models/due_charge_reduction.dart';
import 'models/update_due_charge_request_body.dart';

/// Updates an existing Due Charge.
///
/// This method allows you to update an existing Due Charge with new
/// information. By providing the necessary parameters, you can modify various
/// aspects of the charge.
///
/// To update a Due Charge, you need to provide the unique identifier
/// of the charge using the [txid] parameter. This identifier ensures that the
/// correct charge is being updated.
///
/// The [dueDate], [debtorDetails], and [originalValue] parameters allow you
/// to change the due date, debtor details, and the original value of the Due
/// Charge, respectively.
///
/// You can also modify the [pixKey] associated with the charge, if needed.
///
/// Additionally, you can provide the [expiryDaysAfterExpiration] to update
/// the deadline for the payer to complete the payment.
///
/// The [locationId] parameter allows you to update the location identifier
/// associated with the charge, if applicable.
///
/// The [status] parameter enables you to change the status of the charge to
/// reflect its current state accurately.
///
/// The [fine], [interestRate], [reduction], and [discount] parameters allow
/// you to update the additional details of the Due Charge.
///
/// To provide any payer solicitation or instructions, you can use the
/// [payerSolicitation] parameter to update the solicitation message.
///
/// If needed, you can modify the [additionalInfo] parameter to include or
/// update supplementary information relevant to the charge.
class UpdateDueCharge {
  final GerenciaNetPlusPixRestClient _client;

  /// Updates an existing Due Charge.
  ///
  /// This method allows you to update an existing Due Charge with new
  /// information. By providing the necessary parameters, you can modify various
  /// aspects of the charge.
  ///
  /// To update a Due Charge, you need to provide the unique identifier
  /// of the charge using the [txid] parameter. This identifier ensures that the
  /// correct charge is being updated.
  ///
  /// The [dueDate], [debtorDetails], and [originalValue] parameters allow you
  /// to change the due date, debtor details, and the original value of the Due
  /// Charge, respectively.
  ///
  /// You can also modify the [pixKey] associated with the charge, if needed.
  ///
  /// Additionally, you can provide the [expiryDaysAfterExpiration] to update
  /// the deadline for the payer to complete the payment.
  ///
  /// The [locationId] parameter allows you to update the location identifier
  /// associated with the charge, if applicable.
  ///
  /// The [status] parameter enables you to change the status of the charge to
  /// reflect its current state accurately.
  ///
  /// The [fine], [interestRate], [reduction], and [discount] parameters allow
  /// you to update the additional details of the Due Charge.
  ///
  /// To provide any payer solicitation or instructions, you can use the
  /// [payerSolicitation] parameter to update the solicitation message.
  ///
  /// If needed, you can modify the [additionalInfo] parameter to include or
  /// update supplementary information relevant to the charge.
  const UpdateDueCharge(this._client);

  /// Updates an existing Due Charge.
  ///
  /// This method allows you to update an existing Due Charge with new
  /// information. By providing the necessary parameters, you can modify various
  /// aspects of the charge.
  ///
  /// To update a Due Charge, you need to provide the unique identifier
  /// of the charge using the [txid] parameter. This identifier ensures that the
  /// correct charge is being updated.
  ///
  /// The [dueDate], [debtorDetails], and [originalValue] parameters allow you
  /// to change the due date, debtor details, and the original value of the Due
  /// Charge, respectively.
  ///
  /// You can also modify the [pixKey] associated with the charge, if needed.
  ///
  /// Additionally, you can provide the [expiryDaysAfterExpiration] to update
  /// the deadline for the payer to complete the payment.
  ///
  /// The [locationId] parameter allows you to update the location identifier
  /// associated with the charge, if applicable.
  ///
  /// The [status] parameter enables you to change the status of the charge to
  /// reflect its current state accurately.
  ///
  /// The [fine], [interestRate], [reduction], and [discount] parameters allow
  /// you to update the additional details of the Due Charge.
  ///
  /// To provide any payer solicitation or instructions, you can use the
  /// [payerSolicitation] parameter to update the solicitation message.
  ///
  /// If needed, you can modify the [additionalInfo] parameter to include or
  /// update supplementary information relevant to the charge.
  Future<DueCharge> call(
    String txid, {
    required DateTime? dueDate,
    required DebtorDetails? debtorDetails,
    required double? originalValue,
    required String? pixKey,
    required int? expiryDaysAfterExpiration,
    required int? locationId,
    required ChargeStatus? status,
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
      status: status,
      fine: fine,
      interestRate: interestRate,
      reduction: reduction,
      discount: discount,
      payerSolicitation: payerSolicitation,
      additionalInfo: additionalInfo,
    );

    final endPoint = _client.pixEndPoints.dueCharge.updateDueCharge(txid);

    try {
      final response = await _client<Map<String, dynamic>>(
        endPoint: endPoint,
        body: body.toMap(),
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
