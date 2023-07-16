// Project imports:
import '../../../config/http_client/gerencia_net_plus_pix_rest_client.dart';
import '../../../config/utils/date_extensions.dart';
import '../../../config/utils/map_extensions.dart';
import 'models/location_info_pagination.dart';

class ListLocations {
  final GerenciaNetPlusPixRestClient _client;

  const ListLocations(this._client);

  Future<LocationInfoPagination> call({
    required DateTime start,
    required DateTime end,
    required int? pageNumber,
    required int? pageSize,
  }) async {
    final params = <String, dynamic>{
      'inicio': start.toRFC3339(),
      'fim': end.toRFC3339(),
    }..addAllIfNotNull({
        'paginacao.paginaAtual': pageNumber,
        'paginacao.itensPorPagina': pageSize,
      });

    final endPoint = _client.pixEndPoints.location.listLocations();

    final result = await _client<Map<String, dynamic>>(
      endPoint: endPoint,
      queryParameters: params,
    );

    return LocationInfoPagination.fromMap(result.data!);
  }
}
