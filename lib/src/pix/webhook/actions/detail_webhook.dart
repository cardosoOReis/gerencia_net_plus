// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import '../../../config/http_client/gerencia_net_plus_pix_rest_client.dart';
import '../../../core/gerencia_net_exception.dart';
import '../models/pix_webhook.dart';

/// Retrieves the details of a webhook for a specific PIX key.
///
/// The [pixKey] parameter (if provided) specifies the PIX key for which the
/// webhook details are retrieved. If [pixKey] is not provided, the method
/// uses the PIX key from the [GerenciaNetCredentials].
class DetailWebhook {
  final GerenciaNetPlusPixRestClient _client;

  /// Retrieves the details of a webhook for a specific PIX key.
  ///
  /// The [pixKey] parameter (if provided) specifies the PIX key for which the
  /// webhook details are retrieved. If [pixKey] is not provided, the method
  /// uses the PIX key from the [GerenciaNetCredentials].
  const DetailWebhook(this._client);

  /// Retrieves the details of a webhook for a specific PIX key.
  ///
  /// The [pixKey] parameter (if provided) specifies the PIX key for which the
  /// webhook details are retrieved. If [pixKey] is not provided, the method
  /// uses the PIX key from the [GerenciaNetCredentials].
  Future<PixWebhook> call(String pixKey) async {
    final endpoint = _client.pixEndPoints.webhook.pixDetailWebhook(pixKey);

    try {
      final response = await _client<Map<String, dynamic>>(endPoint: endpoint);

      return PixWebhook.fromMap(response.data!);
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
