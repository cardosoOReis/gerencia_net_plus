import '../../config/http_client/gerencia_net_plus_pix_rest_client.dart';
import '../models/charge_type.dart';
import '../models/location_info.dart';
import 'actions/create_location.dart';

class LocationOperations {
  final GerenciaNetPlusPixRestClient _client;
  const LocationOperations({
    required GerenciaNetPlusPixRestClient client,
  }) : _client = client;

  Future<LocationInfo> createLocation({
    ChargeType chargeType = ChargeType.immediateCharge,
  }) async {
    final createLocation = CreateLocation(_client);

    return createLocation(chargeType: chargeType);
  }
}
