// Project imports:
import 'package:dio/dio.dart';

import '../../../config/http_client/gerencia_net_plus_pix_rest_client.dart';
import '../../../config/utils/date_extensions.dart';
import '../../../config/utils/map_extensions.dart';
import '../../../core/gerencia_net_exception.dart';
import '../../models/charge_status.dart';
import '../models/immediate_charge_pagination.dart';

/// List immediate charges.
class ListCharges {
  final GerenciaNetPlusPixRestClient _client;

  /// Default constructor.
  const ListCharges(this._client);

  /// Retrieves a list of Immediate Charges within a specified timeframe.
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
  /// ChargeStatus value, allowing you to focus on charges with specific
  /// processing statuses.
  ///
  /// If there are multiple pages of charges available, you can specify the
  /// desired [pageNumber] to retrieve a specific page. Additionally, you can
  /// control the number of charges to retrieve per page by providing the
  /// [itemAmount] parameter. This allows you to customize the pagination and
  /// retrieve charges in a suitable manner.
  Future<ImmediateChargePagination> call({
    required DateTime start,
    required DateTime end,
    required String? cpf,
    required String? cnpj,
    required ChargeStatus? status,
    required int? pageNumber,
    required int? itemAmount,
  }) async {
    final queryParameters = <String, dynamic>{
      'inicio': start.toRFC3339(),
      'fim': end.toRFC3339(),
    }
      ..addIfNotNull('cpf', cpf)
      ..addIfNotNull('cnpj', cnpj)
      ..addIfNotNull('status', status?.value)
      ..addIfNotNull('paginacao.paginaAtual', pageNumber)
      ..addIfNotNull('paginacao.itensPorPagina', itemAmount);

    final endPoint = _client.pixEndPoints.immediateCharge.pixListCharges();

    try {
      final result = await _client<Map<String, dynamic>>(
        endPoint: endPoint,
        queryParameters: queryParameters,
      );

      return ImmediateChargePagination.fromMap(result.data!);
    } on DioException catch (e, s) {
      throw GerenciaNetException(
        title: e.response?.data['nome'] ?? e.message,
        message: e.response?.data['mensagem'] ?? e.message,
        statusCode: e.response?.statusCode,
        originalException: e,
        stackTrace: s,
      );
    }
  }
}
