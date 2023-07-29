// Project imports:
import 'package:dio/dio.dart';

import '../../../config/http_client/gerencia_net_plus_pix_rest_client.dart';
import '../../../core/gerencia_net_exception.dart';
import '../../models/recieved_pix.dart';

class DetailRecievedPix {
  final GerenciaNetPlusPixRestClient _client;

  const DetailRecievedPix(this._client);

  Future<RecievedPix> call(String endToEndId) async {
    final endpoint = _client.pixEndPoints.transactions.detailRecievedPix(
      endToEndId,
    );

    try {
      final result = await _client<Map<String, dynamic>>(endPoint: endpoint);

      return RecievedPix.fromMap(result.data!);
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
