// Project imports:
import 'package:dio/dio.dart';

import '../../../config/http_client/gerencia_net_plus_pix_rest_client.dart';
import '../../../config/utils/map_extensions.dart';
import '../../../core/gerencia_net_exception.dart';
import '../models/due_charge.dart';

class DetailDueCharge {
  final GerenciaNetPlusPixRestClient _client;

  const DetailDueCharge(this._client);

  Future<DueCharge> call(
    String txid, {
    required int? revision,
  }) async {
    final params = <String, dynamic>{}..addIfNotNull('revisao', revision);

    final endPoint = _client.pixEndPoints.dueCharge.detailDueCharge(txid);

    try {
      final response = await _client<Map<String, dynamic>>(
        endPoint: endPoint,
        queryParameters: params,
      );

      return DueCharge.fromMap(response.data!);
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
