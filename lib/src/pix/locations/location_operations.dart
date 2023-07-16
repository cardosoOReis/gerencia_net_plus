// Project imports:
import '../../config/http_client/gerencia_net_plus_pix_rest_client.dart';
import '../models/charge_type.dart';
import '../models/location_info.dart';
import 'actions/create_location.dart';
import 'actions/detail_location.dart';
import 'actions/list_locations.dart';
import 'actions/models/location_info_pagination.dart';
import 'actions/unbind_txid_from_location.dart';
import 'models/location_with_txid.dart';

class LocationOperations {
  final GerenciaNetPlusPixRestClient _client;
  const LocationOperations({
    required GerenciaNetPlusPixRestClient client,
  }) : _client = client;

  Future<LocationInfoWithTxid> createLocation({
    ChargeType chargeType = ChargeType.immediateCharge,
  }) async {
    final createLocation = CreateLocation(_client);

    return createLocation(chargeType: chargeType);
  }

  Future<LocationInfoPagination> listLocations({
    required DateTime start,
    required DateTime end,
    int? pageNumber,
    int? pageSize,
  }) async {
    final listLocations = ListLocations(_client);

    return listLocations(
      start: start,
      end: end,
      pageNumber: pageNumber,
      pageSize: pageSize,
    );
  }

  Future<LocationInfoWithTxid> detailLocation(int id) async {
    final detailLocation = DetailLocation(_client);

    return detailLocation(id);
  }

  Future<LocationInfo> unbindTxidFromLocation(int id) async {
    final unbindTxidFromLocation = UnbindTxidFromLocation(_client);

    return unbindTxidFromLocation(id);
  }
}
