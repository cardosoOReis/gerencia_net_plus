// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import '../../../config/http_client/gerencia_net_plus_pix_rest_client.dart';
import '../../../core/gerencia_net_exception.dart';

/// Configures a webhook for PIX transactions.
///
/// The [webhook] parameter specifies the URL to which the webhook
/// notifications will be sent.
///
/// Additionally, the [pixKey] parameter (if
/// provided) sets a specific PIX key for which the webhook is configured.
/// If [pixKey] is not provided, the method uses the PIX key from the
/// [GerenciaNetCredentials].
class ConfigureWebhook {
  final GerenciaNetPlusPixRestClient _client;

  /// Configures a webhook for PIX transactions.
  ///
  /// The [webhook] parameter specifies the URL to which the webhook
  /// notifications will be sent.
  ///
  /// Additionally, the [pixKey] parameter (if
  /// provided) sets a specific PIX key for which the webhook is configured.
  /// If [pixKey] is not provided, the method uses the PIX key from the
  /// [GerenciaNetCredentials].
  const ConfigureWebhook(this._client);

  /// Configures a webhook for PIX transactions.
  ///
  /// The [webhook] parameter specifies the URL to which the webhook
  /// notifications will be sent.
  ///
  /// Additionally, the [pixKey] parameter (if
  /// provided) sets a specific PIX key for which the webhook is configured.
  /// If [pixKey] is not provided, the method uses the PIX key from the
  /// [GerenciaNetCredentials].
  Future<Uri> call({
    required Uri webhookUrl,
    required String pixKey,
  }) async {
    final body = {
      'webhookUrl': webhookUrl.toString(),
    };

    final endpoint = _client.pixEndPoints.webhook.pixConfigWebhook(pixKey);

    try {
      final response = await _client<Map<String, dynamic>>(
        endPoint: endpoint,
        body: body,
      );

      return Uri.parse(response.data!['webhookUrl']);
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
