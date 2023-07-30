// Project imports:
import '../../config/http_client/gerencia_net_plus_pix_rest_client.dart';
import '../models/charge_type.dart';
import '../models/location_info.dart';
import 'actions/create_location.dart';
import 'actions/detail_location.dart';
import 'actions/list_locations.dart';
import 'actions/unbind_txid_from_location.dart';
import 'models/location_info_pagination.dart';
import 'models/location_with_txid.dart';

/// Groups all available Location operations.
///
/// If you want to use QR Code functionality, use the `qrCode` property.
class LocationOperations {
  final GerenciaNetPlusPixRestClient _client;

  /// Groups all available Location operations.
  ///
  /// If you want to use QR Code functionality, use the `qrCode` property.
  const LocationOperations({
    required GerenciaNetPlusPixRestClient client,
  }) : _client = client;

  /// Creates a location with a specific [ChargeType].
  ///
  /// After creating this location, it still won't have a charge associated with
  /// it, you need to manually assign a charge to it. You can only associate
  /// a charge with the same [ChargeType] as the location.
  Future<LocationInfoWithTxid> createLocation({
    ChargeType chargeType = ChargeType.immediateCharge,
  }) async {
    final createLocation = CreateLocation(_client);

    return createLocation(chargeType: chargeType);
  }

  /// List all locations associated with your account.
  ///
  /// By providing the [start] and [end] parameters, you can define the desired
  /// period for which you want to retrieve the charges. This allows you to
  /// fetch locations created during a specific timeframe.
  ///
  /// If there are multiple pages of locations available, you can specify the
  /// desired [pageNumber] to retrieve a specific page. Additionally, you can
  /// control the number of locations to retrieve per page by providing the
  /// [pageSize] parameter. This allows you to customize the pagination and
  /// retrieve locations in a suitable manner.
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

  /// Details a location with the given [id].
  Future<LocationInfoWithTxid> detailLocation(int id) async {
    final detailLocation = DetailLocation(_client);

    return detailLocation(id);
  }

  /// Unbinds the charge associated with the location's [id].
  ///
  /// If the call is successful, the location won't have a txid associated with
  /// it anymore. Additionally, the charge entity with the unbinded txid won't
  /// have a location anymore. This operation doesn't change the [status] of the
  /// [ImmediateCharge] or the [DueCharge].
  Future<LocationInfo> unbindTxidFromLocation(int id) async {
    final unbindTxidFromLocation = UnbindTxidFromLocation(_client);

    return unbindTxidFromLocation(id);
  }
}
