import '../../../config/http_client/gerencia_net_plus_pix_rest_client.dart';
import '../../models/charge_type.dart';
import '../../models/location_info.dart';

class CreateLocation {
  final GerenciaNetPlusPixRestClient _client;

  const CreateLocation(this._client);

  Future<LocationInfo> call({
    required ChargeType chargeType,
  }) async {
    final body = {
      'tipoCob': chargeType.value,
    };

    final endPoint = _client.pixEndPoints.location.createLocation();

    final result = await _client<Map<String, dynamic>>(
      endPoint: endPoint,
      body: body,
    );

    return LocationInfo.fromMap(result.data!);
  }
}
