import '../../../config/http_client/gerencia_net_plus_pix_rest_client.dart';
import '../../models/devolution.dart';

class RequestDevolution {
  final GerenciaNetPlusPixRestClient _client;

  const RequestDevolution(this._client);

  Future<Devolution> call({
    required String e2eId,
    required String devolutionId,
    required double value,
  }) async {
    final body = {
      'valor': value.toStringAsFixed(2),
    };

    final endpoint = _client.pixEndPoints.transactions.requestDevolution(
      e2eId,
      devolutionId,
    );

    final response = await _client<Map<String, dynamic>>(
      endPoint: endpoint,
      body: body,
    );

    return Devolution.fromMap(response.data!);
  }
}
