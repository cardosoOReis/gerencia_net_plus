// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import '../../../config/http_client/gerencia_net_plus_pix_rest_client.dart';
import '../../../config/utils/date_extensions.dart';
import '../../../config/utils/map_extensions.dart';
import '../../../core/gerencia_net_exception.dart';
import '../../models/charge_status.dart';
import '../models/due_charge_pagination.dart';

/// Retrieves a list of Due Charges within a specified timeframe.
///
/// By providing the [start] and [end] parameters, you can define the desired
/// period for which you want to retrieve the charges. This allows you to
/// fetch charges created during a specific timeframe.
///
/// Optionally, you can further refine the search results by utilizing
/// additional parameters. For example, you can provide a [cpf]
/// (Brazilian individual taxpayer registry) or [cnpj] (Brazilian corporate
/// taxpayer registry) to filter charges associated with specific entities.
/// Moreover, you can specify a [status] to retrieve charges with a particular
/// [SentPixStatus] value, allowing you to focus on charges with specific
/// processing statuses.
///
/// If there are multiple pages of charges available, you can specify the
/// desired [pageNumber] to retrieve a specific page. Additionally, you can
/// control the number of charges to retrieve per page by providing the
/// [pageSize] parameter. This allows you to customize the pagination and
/// retrieve charges in a suitable manner.
class ListDueCharges {
  final GerenciaNetPlusPixRestClient _client;

  /// Retrieves a list of Due Charges within a specified timeframe.
  ///
  /// By providing the [start] and [end] parameters, you can define the desired
  /// period for which you want to retrieve the charges. This allows you to
  /// fetch charges created during a specific timeframe.
  ///
  /// Optionally, you can further refine the search results by utilizing
  /// additional parameters. For example, you can provide a [cpf]
  /// (Brazilian individual taxpayer registry) or [cnpj] (Brazilian corporate
  /// taxpayer registry) to filter charges associated with specific entities.
  /// Moreover, you can specify a [status] to retrieve charges with a particular
  /// [SentPixStatus] value, allowing you to focus on charges with specific
  /// processing statuses.
  ///
  /// If there are multiple pages of charges available, you can specify the
  /// desired [pageNumber] to retrieve a specific page. Additionally, you can
  /// control the number of charges to retrieve per page by providing the
  /// [pageSize] parameter. This allows you to customize the pagination and
  /// retrieve charges in a suitable manner.
  const ListDueCharges(this._client);

  /// Retrieves a list of Due Charges within a specified timeframe.
  ///
  /// By providing the [start] and [end] parameters, you can define the desired
  /// period for which you want to retrieve the charges. This allows you to
  /// fetch charges created during a specific timeframe.
  ///
  /// Optionally, you can further refine the search results by utilizing
  /// additional parameters. For example, you can provide a [cpf]
  /// (Brazilian individual taxpayer registry) or [cnpj] (Brazilian corporate
  /// taxpayer registry) to filter charges associated with specific entities.
  /// Moreover, you can specify a [status] to retrieve charges with a particular
  /// [SentPixStatus] value, allowing you to focus on charges with specific
  /// processing statuses.
  ///
  /// If there are multiple pages of charges available, you can specify the
  /// desired [pageNumber] to retrieve a specific page. Additionally, you can
  /// control the number of charges to retrieve per page by providing the
  /// [pageSize] parameter. This allows you to customize the pagination and
  /// retrieve charges in a suitable manner.
  Future<DueChargePagination> call({
    required DateTime start,
    required DateTime end,
    required String? cpf,
    required String? cnpj,
    required bool? hasLocation,
    required ChargeStatus? status,
    required int? idDueChargeBatch,
    required int? pageNumber,
    required int? pageSize,
  }) async {
    final params = <String, dynamic>{
      'inicio': start.toRFC3339(),
      'fim': end.toRFC3339(),
    }..addAllIfNotNull({
        'cpf': cpf,
        'cnpj': cnpj,
        'locationPresente': hasLocation,
        'status': status,
        'loteCobVID': idDueChargeBatch,
        'paginacao.paginaAtual': pageNumber,
        'paginacao.itensPorPagina': pageSize,
      });

    final endPoint = _client.pixEndPoints.dueCharge.listDueCharges();

    try {
      final response = await _client<Map<String, dynamic>>(
        endPoint: endPoint,
        queryParameters: params,
      );

      return DueChargePagination.fromMap(response.data!);
    } on DioException catch (e, s) {
      throw GerenciaNetException(
        title: e.response?.data['title'],
        message: e.response?.data['detail'],
        statusCode: e.response?.data['status'] ?? e.response?.statusCode,
        originalException: e,
        stackTrace: s,
      );
    }
  }
}
