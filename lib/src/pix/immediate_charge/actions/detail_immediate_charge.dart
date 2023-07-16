// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import '../../../config/http_client/gerencia_net_plus_pix_rest_client.dart';
import '../../../core/gerencia_net_exception.dart';
import '../models/immediate_charge.dart';

/// Details an Immediate Charge with the given [txid].
///
/// Optionally, you can specify the [revision] parameter to retrieve a
/// specific revision of the charge. If provided, the function will return
/// the charge as it existed at the specified revision. If no revision is
/// specified, the function will return the most recent version of the charge.
class DetailCharge {
  final GerenciaNetPlusPixRestClient _client;

  /// Details an Immediate Charge with the given [txid].
  ///
  /// Optionally, you can specify the [revision] parameter to retrieve a
  /// specific revision of the charge. If provided, the function will return
  /// the charge as it existed at the specified revision. If no revision is
  /// specified, the function will return the most recent version of the charge.
  const DetailCharge(this._client);

  /// Details an Immediate Charge with the given [txid].
  ///
  /// Optionally, you can specify the [revision] parameter to retrieve a
  /// specific revision of the charge. If provided, the function will return
  /// the charge as it existed at the specified revision. If no revision is
  /// specified, the function will return the most recent version of the charge.
  Future<ImmediateCharge> call({
    required String txid,
    int? revision,
  }) async {
    final endPoint = _client.pixEndPoints.immediateCharge.pixDetailCharge(txid);
    final queryParameters = <String, dynamic>{};
    if (revision != null) {
      queryParameters.addAll({
        'revisao': revision,
      });
    }

    try {
      final result = await _client<Map<String, dynamic>>(
        endPoint: endPoint,
        queryParameters: queryParameters,
      );

      return ImmediateCharge.fromMap(result.data!);
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
