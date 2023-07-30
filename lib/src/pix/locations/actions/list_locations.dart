// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import '../../../config/http_client/gerencia_net_plus_pix_rest_client.dart';
import '../../../config/utils/date_extensions.dart';
import '../../../config/utils/map_extensions.dart';
import '../../../core/gerencia_net_exception.dart';
import '../models/location_info_pagination.dart';

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
class ListLocations {
  final GerenciaNetPlusPixRestClient _client;

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
  const ListLocations(this._client);

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

    try {
      final result = await _client<Map<String, dynamic>>(
        endPoint: endPoint,
        queryParameters: params,
      );

      return LocationInfoPagination.fromMap(result.data!);
    } on DioException catch (e, s) {
      throw GerenciaNetException(
        title: e.response?.data['nome'],
        message: e.response?.data['mensagem'],
        statusCode: e.response?.statusCode,
        originalException: e,
        stackTrace: s,
      );
    }
  }
}
