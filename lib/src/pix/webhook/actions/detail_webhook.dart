import '../../../config/http_client/gerencia_net_plus_pix_rest_client.dart';
import '../models/pix_webhook.dart';

class DetailWebhook {
  final GerenciaNetPlusPixRestClient _client;

  const DetailWebhook(this._client);

  Future<PixWebhook> call(String pixKey) async {
    final endpoint = _client.pixEndPoints.webhook.pixDetailWebhook(pixKey);

    final response = await _client<Map<String, dynamic>>(endPoint: endpoint);

    return PixWebhook.fromMap(response.data!);
  }
}
