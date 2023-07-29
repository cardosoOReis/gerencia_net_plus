// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import '../../../config/http_client/gerencia_net_plus_pix_rest_client.dart';
import '../../../core/gerencia_net_exception.dart';
import '../models/detailed_sent_pix.dart';

class DetailSentPix {
  final GerenciaNetPlusPixRestClient _client;

  const DetailSentPix(this._client);

  Future<DetailedSentPix> call(String e2eId) async {
    final endpoint = _client.pixEndPoints.transactions.detailSentPix(e2eId);

    try {
      final response = await _client<Map<String, dynamic>>(endPoint: endpoint);

      return DetailedSentPix.fromMap(response.data!);
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
