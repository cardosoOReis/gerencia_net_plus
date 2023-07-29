import 'package:dio/dio.dart';

import '../../../config/http_client/gerencia_net_plus_pix_rest_client.dart';
import '../../../core/gerencia_net_exception.dart';

class ConfigureWebhook {
  final GerenciaNetPlusPixRestClient _client;

  const ConfigureWebhook(this._client);

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
