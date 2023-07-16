// Project imports:
import '../../../config/http_client/gerencia_net_plus_pix_rest_client.dart';
import '../models/location_with_txid.dart';

class DetailLocation {
  final GerenciaNetPlusPixRestClient _client;

  const DetailLocation(this._client);

  Future<LocationInfoWithTxid> call(int id) async {
    final endPoint = _client.pixEndPoints.location.detailLocation(id);

    final result = await _client<Map<String, dynamic>>(endPoint: endPoint);

    return LocationInfoWithTxid.fromMap(result.data!);
  }
}
