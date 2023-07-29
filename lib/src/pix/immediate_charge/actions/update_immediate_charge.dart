// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import '../../../config/http_client/gerencia_net_plus_pix_rest_client.dart';
import '../../../core/gerencia_net_exception.dart';
import '../../models/additional_info.dart';
import '../../models/charge_status.dart';
import '../models/debtor.dart';
import '../models/immediate_charge.dart';
import 'models/update_charge_request_body.dart';

/// Updates an Immediate Charge with the given [txid].
///
/// This function allows you to update an existing Immediate Charge with new
/// information. By providing the necessary parameters, you can modify various
/// aspects of the charge to reflect changes or updates.
///
/// To update an immediate charge, you need to provide the unique identifier
/// of the charge using the [txid] parameter. This identifier ensures that the
/// correct charge is being updated.
///
/// The [value] parameter allows you to change the amount of money associated
/// with the immediate charge. By providing a new value, you can update the
/// payment amount. Similarly, the [locId] parameter enables you to update the
/// location identifier associated with the charge, if applicable.
///
/// If you wish to modify the debtor associated with the immediate charge, you
/// can provide a new [debtor] object containing the updated debtor
/// information. Additionally, you can change the [status] of the charge to
/// reflect its current state accurately.
///
/// To update the Pix key associated with the charge, you can provide a new
/// [pixKey]. This is useful when changing the recipient's Pix key for the
/// payment. Furthermore, you can modify the [additionalInfo] parameter to
/// include any additional or updated information related to the immediate
/// charge, such as updated order details or reference numbers.
///
/// Finally, the [payerSolicitation] parameter allows you to update the
/// solicitation message that can be sent to the payer, providing updated
/// instructions or additional context.
class UpdateCharge {
  final GerenciaNetPlusPixRestClient _client;

  /// Updates an Immediate Charge with the given [txid].
  ///
  /// This function allows you to update an existing Immediate Charge with new
  /// information. By providing the necessary parameters, you can modify various
  /// aspects of the charge to reflect changes or updates.
  ///
  /// To update an immediate charge, you need to provide the unique identifier
  /// of the charge using the [txid] parameter. This identifier ensures that the
  /// correct charge is being updated. Additionally, you can specify the
  /// [persist] parameter, which determines whether the only changes made to the
  /// charge are the ones passed. If set to true, the only changes made are the
  /// ones passed in the parameters. Otherwise, this is the same thing as
  /// creating a new Immediate Charge, while maintaining the same [txid].
  ///
  /// The [value] parameter allows you to change the amount of money associated
  /// with the immediate charge. By providing a new value, you can update the
  /// payment amount. Similarly, the [locId] parameter enables you to update the
  /// location identifier associated with the charge, if applicable.
  ///
  /// If you wish to modify the debtor associated with the immediate charge, you
  /// can provide a new [debtor] object containing the updated debtor
  /// information. Additionally, you can change the [status] of the charge to
  /// reflect its current state accurately.
  ///
  /// To update the Pix key associated with the charge, you can provide a new
  /// [pixKey]. This is useful when changing the recipient's Pix key for the
  /// payment. Furthermore, you can modify the [additionalInfo] parameter to
  /// include any additional or updated information related to the immediate
  /// charge, such as updated order details or reference numbers.
  ///
  /// Finally, the [payerSolicitation] parameter allows you to update the
  /// solicitation message that can be sent to the payer, providing updated
  /// instructions or additional context.
  const UpdateCharge(this._client);

  /// Updates an Immediate Charge with the given [txid]
  ///
  /// This function allows you to update an existing Immediate Charge with new
  /// information. By providing the necessary parameters, you can modify various
  /// aspects of the charge to reflect changes or updates.
  ///
  /// To update an immediate charge, you need to provide the unique identifier
  /// of the charge using the [txid] parameter. This identifier ensures that the
  /// correct charge is being updated.
  ///
  /// The [value] parameter allows you to change the amount of money associated
  /// with the immediate charge. By providing a new value, you can update the
  /// payment amount. Similarly, the [locId] parameter enables you to update the
  /// location identifier associated with the charge, if applicable.
  ///
  /// If you wish to modify the debtor associated with the immediate charge, you
  /// can provide a new [debtor] object containing the updated debtor
  /// information. Additionally, you can change the [status] of the charge to
  /// reflect its current state accurately.
  ///
  /// To update the Pix key associated with the charge, you can provide a new
  /// [pixKey]. This is useful when changing the recipient's Pix key for the
  /// payment. Furthermore, you can modify the [additionalInfo] parameter to
  /// include any additional or updated information related to the immediate
  /// charge, such as updated order details or reference numbers.
  ///
  /// Finally, the [payerSolicitation] parameter allows you to update the
  /// solicitation message that can be sent to the payer, providing updated
  /// instructions or additional context.
  Future<ImmediateCharge> call({
    required String txid,
    required double? value,
    required int? locId,
    required Debtor? debtor,
    required String? payerSolicitation,
    required String? pixKey,
    required List<AdditionalInfo>? additionalInfo,
    required ChargeStatus? status,
  }) async {
    final body = UpdateChargeRequestBody(
      locId: locId,
      value: value,
      debtor: debtor,
      payerSolicitation: payerSolicitation,
      pixKey: pixKey,
      additionalInfo: additionalInfo,
      status: status,
    );

    final endPoint = _client.pixEndPoints.immediateCharge.pixUpdateCharge(txid);

    try {
      final response = await _client<Map<String, dynamic>>(
        endPoint: endPoint,
        body: body.toMap(),
      );

      return ImmediateCharge.fromMap(response.data!);
    } on DioException catch (e, s) {
      throw GerenciaNetException(
        title: e.response?.data['nome'] ?? e.message,
        message: e.response?.data['mensagem'] ?? e.message,
        statusCode: e.response?.statusCode,
        originalException: e,
        stackTrace: s,
      );
    }
  }
}
