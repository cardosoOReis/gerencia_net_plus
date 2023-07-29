// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import '../../../config/http_client/gerencia_net_plus_pix_rest_client.dart';
import '../../../core/gerencia_net_exception.dart';

class CancelWebhook {
  final GerenciaNetPlusPixRestClient _client;

  const CancelWebhook(this._client);

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
