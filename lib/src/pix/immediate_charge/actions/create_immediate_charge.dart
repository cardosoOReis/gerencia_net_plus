// Dart imports:

// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import '../../../config/http_client/gerencia_net_plus_pix_rest_client.dart';
import '../../../config/utils/txid.dart' as txid_utils;
import '../../../core/gerencia_net_credentials.dart';
import '../../../core/gerencia_net_exception.dart';
import '../../models/additional_info.dart';
import '../models/debtor.dart';
import '../models/immediate_charge.dart';
import 'models/create_charge_request_body.dart';

/// Creates an Immediate Charge with the given [value].
///
///
/// You can specify an optional [expiration] duration, which
/// sets a deadline for the payer to complete the payment. If no deadline is
/// provided, the expiration will default to 30 days.
///
/// Optionally, you can assign a unique identifier to the immediate charge by
/// providing the [txid] parameter. An txid must have a length of 26-35, and
/// also contain only the characters a-z, A-Z and 0-9. A valid [txid] Regex
/// is ^[a-zA-Z0-9]{26,35}$.  If you leave it empty, a random identifier
/// will be generated for the charge.
///
/// If this charge is set to a specific person, the [debtor] parameter allows
/// you to specify the person responsible for paying the immediate charge.
/// They can be either a [PhysicalPerson] or a [LegalPerson].
///
/// If you wish to include additional context or instructions for the payer,
/// you can utilize the [payerSolicitation] parameter, which allows you to
/// provide a solicitation message. Moreover, the [additionalInfo] parameter
/// enables you to include any supplementary information that may be relevant
/// to the immediate charge, such as order details or a reference number.
class CreateCharge {
  final GerenciaNetPlusPixRestClient _client;

  /// Creates an Immediate Charge with the given [value].
  ///
  ///
  /// You can specify an optional [expiration] duration, which
  /// sets a deadline for the payer to complete the payment. If no deadline is
  /// provided, the expiration will default to 30 days.
  ///
  /// Optionally, you can assign a unique identifier to the immediate charge by
  /// providing the [txid] parameter. An txid must have a length of 26-35, and
  /// also contain only the characters a-z, A-Z and 0-9. A valid [txid] Regex
  /// is ^[a-zA-Z0-9]{26,35}$.  If you leave it empty, a random identifier
  /// will be generated for the charge.
  ///
  /// If this charge is set to a specific person, the [debtor] parameter allows
  /// you to specify the person responsible for paying the immediate charge.
  /// They can be either a [PhysicalPerson] or a [LegalPerson].
  ///
  /// If you wish to include additional context or instructions for the payer,
  /// you can utilize the [payerSolicitation] parameter, which allows you to
  /// provide a solicitation message. Moreover, the [additionalInfo] parameter
  /// enables you to include any supplementary information that may be relevant
  /// to the immediate charge, such as order details or a reference number.
  const CreateCharge(this._client);

  /// Creates an Immediate Charge with the given [value].
  ///
  ///
  /// You can specify an optional [expiration] duration, which
  /// sets a deadline for the payer to complete the payment. If no deadline is
  /// provided, the expiration will default to 30 days.
  ///
  /// Optionally, you can assign a unique identifier to the immediate charge by
  /// providing the [txid] parameter. An txid must have a length of 26-35, and
  /// also contain only the characters a-z, A-Z and 0-9. A valid [txid] Regex
  /// is ^[a-zA-Z0-9]{26,35}$.  If you leave it empty, a random identifier
  /// will be generated for the charge.
  ///
  /// If this charge is set to a specific person, the [debtor] parameter allows
  /// you to specify the person responsible for paying the immediate charge.
  /// They can be either a [PhysicalPerson] or a [LegalPerson].
  ///
  /// If you wish to include additional context or instructions for the payer,
  /// you can utilize the [payerSolicitation] parameter, which allows you to
  /// provide a solicitation message. Moreover, the [additionalInfo] parameter
  /// enables you to include any supplementary information that may be relevant
  /// to the immediate charge, such as order details or a reference number.
  Future<ImmediateCharge> call({
    required GerenciaNetCredentials credentials,
    required double value,
    Duration? expiration,
    String? txid,
    Debtor? debtor,
    String? payerSolicitation,
    List<AdditionalInfo> additionalInfo = const [],
  }) async {
    final body = CreateImmediateChargeRequestBody(
      credentials: credentials,
      expiration: expiration,
      value: value,
      debtor: debtor,
      payerSolicitation: payerSolicitation,
      additionalInfo: additionalInfo,
    );
    final endPoint = _client.pixEndPoints.immediateCharge.pixCreateCharge(
      txid ?? txid_utils.generate(),
    );

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
