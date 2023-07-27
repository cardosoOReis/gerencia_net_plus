import '../../../config/http_client/gerencia_net_plus_pix_rest_client.dart';

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

    final response = await _client<Map<String, dynamic>>(
      endPoint: endpoint,
      body: body,
    );

    return Uri.parse(response.data!['webhookUrl']);
  }
}
