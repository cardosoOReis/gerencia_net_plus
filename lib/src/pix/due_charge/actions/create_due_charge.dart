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

/// Creates a new Due Charge.
///
/// This method allows you to create a Due Charge, representing a payment
/// request using the Pix payment method that has an expiration date set in
/// the future. You must provide the [dueDate] for the charge and specify
/// the [debtorDetails], which contains the information about the person
/// responsible for paying the Due Charge. Additionally, you need to set the
/// [originalValue] of the charge.
///
/// You can optionally provide the [expiryDaysAfterExpiration] to define a
/// deadline after the expiration date for the payer to complete the payment.
/// If not specified, the deadline will default to 30 days.
///
/// Moreover, you can include the [locationId] to set the location identifier
/// for the charge, if applicable.
///
/// The [fine], [interestRate], [reduction], and [discount] parameters allow
/// you to specify additional details related to charges, such as fine and
/// interest rates, reductions, and discounts.
///
/// If you wish to include any payer solicitation or instructions, you can
/// use the [payerSolicitation] parameter to provide a solicitation message.
///
/// To track and identify the Due Charge, you can assign a unique identifier
/// to the charge using the [txid] parameter. A valid [txid] should have a
/// length of 26-35 characters and contain only the characters a-z, A-Z, and
/// 0-9. A valid [txid] should match the regex ^[a-zA-Z0-9]{26,35}$. If left
/// empty, a random identifier will be generated for the charge.
///
/// Additionally, you can provide a list of [additionalInfo] containing
/// supplementary information relevant to the charge, such as order details or
/// reference numbers.
class CreateDueCharge {
  final GerenciaNetPlusPixRestClient _client;

  /// Creates a new Due Charge.
  ///
  /// This method allows you to create a Due Charge, representing a payment
  /// request using the Pix payment method that has an expiration date set in
  /// the future. You must provide the [dueDate] for the charge and specify
  /// the [debtorDetails], which contains the information about the person
  /// responsible for paying the Due Charge. Additionally, you need to set the
  /// [originalValue] of the charge.
  ///
  /// You can optionally provide the [expiryDaysAfterExpiration] to define a
  /// deadline after the expiration date for the payer to complete the payment.
  /// If not specified, the deadline will default to 30 days.
  ///
  /// Moreover, you can include the [locationId] to set the location identifier
  /// for the charge, if applicable.
  ///
  /// The [fine], [interestRate], [reduction], and [discount] parameters allow
  /// you to specify additional details related to charges, such as fine and
  /// interest rates, reductions, and discounts.
  ///
  /// If you wish to include any payer solicitation or instructions, you can
  /// use the [payerSolicitation] parameter to provide a solicitation message.
  ///
  /// To track and identify the Due Charge, you can assign a unique identifier
  /// to the charge using the [txid] parameter. A valid [txid] should have a
  /// length of 26-35 characters and contain only the characters a-z, A-Z, and
  /// 0-9. A valid [txid] should match the regex ^[a-zA-Z0-9]{26,35}$. If left
  /// empty, a random identifier will be generated for the charge.
  ///
  /// Additionally, you can provide a list of [additionalInfo] containing
  /// supplementary information relevant to the charge, such as order details or
  /// reference numbers.
  const CreateDueCharge(this._client);

  /// Creates a new Due Charge.
  ///
  /// This method allows you to create a Due Charge, representing a payment
  /// request using the Pix payment method that has an expiration date set in
  /// the future. You must provide the [dueDate] for the charge and specify
  /// the [debtorDetails], which contains the information about the person
  /// responsible for paying the Due Charge. Additionally, you need to set the
  /// [originalValue] of the charge.
  ///
  /// You can optionally provide the [expiryDaysAfterExpiration] to define a
  /// deadline after the expiration date for the payer to complete the payment.
  /// If not specified, the deadline will default to 30 days.
  ///
  /// Moreover, you can include the [locationId] to set the location identifier
  /// for the charge, if applicable.
  ///
  /// The [fine], [interestRate], [reduction], and [discount] parameters allow
  /// you to specify additional details related to charges, such as fine and
  /// interest rates, reductions, and discounts.
  ///
  /// If you wish to include any payer solicitation or instructions, you can
  /// use the [payerSolicitation] parameter to provide a solicitation message.
  ///
  /// To track and identify the Due Charge, you can assign a unique identifier
  /// to the charge using the [txid] parameter. A valid [txid] should have a
  /// length of 26-35 characters and contain only the characters a-z, A-Z, and
  /// 0-9. A valid [txid] should match the regex ^[a-zA-Z0-9]{26,35}$. If left
  /// empty, a random identifier will be generated for the charge.
  ///
  /// Additionally, you can provide a list of [additionalInfo] containing
  /// supplementary information relevant to the charge, such as order details or
  /// reference numbers.
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
