// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import '../../../config/http_client/gerencia_net_plus_pix_rest_client.dart';
import '../../../core/gerencia_net_exception.dart';
import '../../models/devolution.dart';

class DetailDevolution {
  final GerenciaNetPlusPixRestClient _client;

  const DetailDevolution(this._client);

  Future<Devolution> call({
    required String e2eId,
    required String devolutionId,
  }) async {
    final endpoint = _client.pixEndPoints.transactions.detailDevolution(
      e2eId,
      devolutionId,
    );

    try {
      final response = await _client<Map<String, dynamic>>(endPoint: endpoint);

      return Devolution.fromMap(response.data!);
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
