import '../../../config/http_client/gerencia_net_plus_pix_rest_client.dart';
import '../../models/location_info.dart';

class UnbindTxidFromLocation {
  final GerenciaNetPlusPixRestClient _client;

  const UnbindTxidFromLocation(this._client);

  Future<LocationInfo> call(int id) async {
    final endPoint = _client.pixEndPoints.location.unbindTxidFromLocation(id);

    final result = await _client<Map<String, dynamic>>(endPoint: endPoint);

    return LocationInfo.fromMap(result.data!);
  }
}
