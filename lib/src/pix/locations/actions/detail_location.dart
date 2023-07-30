// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import '../../../config/http_client/gerencia_net_plus_pix_rest_client.dart';
import '../../../core/gerencia_net_exception.dart';
import '../models/location_with_txid.dart';

/// Details a location with the given [id].
class DetailLocation {
  final GerenciaNetPlusPixRestClient _client;

  /// Details a location with the given [id].
  const DetailLocation(this._client);

  /// Details a location with the given [id].
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
