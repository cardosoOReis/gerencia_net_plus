// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import '../../../config/http_client/gerencia_net_plus_pix_rest_client.dart';
import '../../../core/gerencia_net_exception.dart';

/// Cancels the webhook for a specific PIX key.
///
/// The [pixKey] parameter (if provided) specifies the PIX key for which the
/// webhook is canceled. If [pixKey] is not provided, the method uses the PIX
/// key from the [GerenciaNetCredentials].
class CancelWebhook {
  final GerenciaNetPlusPixRestClient _client;

  /// Cancels the webhook for a specific PIX key.
  ///
  /// The [pixKey] parameter (if provided) specifies the PIX key for which the
  /// webhook is canceled. If [pixKey] is not provided, the method uses the PIX
  /// key from the [GerenciaNetCredentials].
  const CancelWebhook(this._client);

  /// Cancels the webhook for a specific PIX key.
  ///
  /// The [pixKey] parameter (if provided) specifies the PIX key for which the
  /// webhook is canceled. If [pixKey] is not provided, the method uses the PIX
  /// key from the [GerenciaNetCredentials].
  Future<void> call(String pixKey) async {
    final endpoint = _client.pixEndPoints.webhook.pixDeleteWebhook(pixKey);

    try {
      await _client<Map<String, dynamic>>(endPoint: endpoint);
    } on DioException catch (e, s) {
      throw GerenciaNetException(
        title: e.response?.data['nome'],
        message: e.response?.data['mensagem'],
        statusCode: e.response?.statusCode,
        originalException: e,
        stackTrace: s,
      );
    }
  }
}
