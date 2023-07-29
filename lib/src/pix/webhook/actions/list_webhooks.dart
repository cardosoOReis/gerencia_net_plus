import 'package:dio/dio.dart';

import '../../../config/http_client/gerencia_net_plus_pix_rest_client.dart';
import '../../../config/utils/date_extensions.dart';
import '../../../core/gerencia_net_exception.dart';
import '../models/pix_webhook_pagination.dart';

class ListWebhook {
  final GerenciaNetPlusPixRestClient _client;

  const ListWebhook(this._client);

  Future<PixWebhookPagination> call({
    required DateTime start,
    required DateTime end,
    required int? pageSize,
    required int? pageNumber,
  }) async {
    final queryParams = {
      'inicio': start.toRFC3339(),
      'fim': end.toRFC3339(),
      'paginacao.paginaAtual': pageNumber,
      'paginacao.itensPorPagina': pageSize,
    };

    final endpoint = _client.pixEndPoints.webhook.pixListWebhook();

    try {
      final response = await _client<Map<String, dynamic>>(
        endPoint: endpoint,
        queryParameters: queryParams,
      );

      return PixWebhookPagination.fromMap(response.data!);
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
