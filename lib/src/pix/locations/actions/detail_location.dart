// Project imports:
import 'package:dio/dio.dart';

import '../../../config/http_client/gerencia_net_plus_pix_rest_client.dart';
import '../../../core/gerencia_net_exception.dart';
import '../models/location_with_txid.dart';

class DetailLocation {
  final GerenciaNetPlusPixRestClient _client;

  const DetailLocation(this._client);

  Future<LocationInfoWithTxid> call(int id) async {
    final endPoint = _client.pixEndPoints.location.detailLocation(id);

    try {
      final result = await _client<Map<String, dynamic>>(endPoint: endPoint);

      return LocationInfoWithTxid.fromMap(result.data!);
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
