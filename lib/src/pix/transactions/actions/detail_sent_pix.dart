import '../../../config/http_client/gerencia_net_plus_pix_rest_client.dart';
import '../models/detailed_sent_pix.dart';

class DetailSentPix {
  final GerenciaNetPlusPixRestClient _client;

  const DetailSentPix(this._client);

  Future<DetailedSentPix> call(String e2eId) async {
    final endpoint = _client.pixEndPoints.transactions.detailSentPix(e2eId);

    final response = await _client<Map<String, dynamic>>(endPoint: endpoint);

    return DetailedSentPix.fromMap(response.data!);
  }
}
