// Project imports:
import 'package:dio/dio.dart';

import '../../../config/http_client/gerencia_net_plus_pix_rest_client.dart';
import '../../../config/utils/date_extensions.dart';
import '../../../config/utils/map_extensions.dart';
import '../../../core/gerencia_net_exception.dart';
import '../models/sent_pix_pagination.dart';
import '../models/sent_pix_status.dart';

class ListSentPix {
  final GerenciaNetPlusPixRestClient _client;

  const ListSentPix(this._client);

  Future<SentPixPagination> call({
    required DateTime start,
    required DateTime end,
    required SentPixStatus? status,
    required bool? hasDevolution,
    required int? pageNumber,
    required int? pageSize,
  }) async {
    final params = <String, dynamic>{
      'inicio': start.toRFC3339(),
      'fim': end.toRFC3339(),
    }..addAllIfNotNull({
        'devolucaoPresente': hasDevolution,
        'status': status?.value,
        'paginacao.paginaAtual': pageNumber,
        'paginacao.itensPorPagina': pageSize,
      });

    final endpoint = _client.pixEndPoints.transactions.listSentPix();

    try {
      final result = await _client<Map<String, dynamic>>(
        endPoint: endpoint,
        queryParameters: params,
      );

      return SentPixPagination.fromMap(result.data!);
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
