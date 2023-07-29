// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import '../../../config/http_client/gerencia_net_plus_pix_rest_client.dart';
import '../../../core/gerencia_net_exception.dart';
import '../models/payee_details.dart';
import '../models/sent_pix.dart';
import 'models/send_pix_request_body.dart';

// Not tested!
class SendPix {
  final GerenciaNetPlusPixRestClient _client;

  const SendPix(this._client);

  Future<SentPix> call({
    required String id,
    required double value,
    required String payerPixKey,
    required PayeeDetails payeeDetails,
    required String? payerInfo,
  }) async {
    final body = SendPixRequestBody(
      value: value,
      payerPixKey: payerPixKey,
      payeeDetails: payeeDetails,
      payerInfo: payerInfo,
    ).toMap();

    final endPoint = _client.pixEndPoints.transactions.sendPix(id);

    try {
      final result = await _client<Map<String, dynamic>>(
        endPoint: endPoint,
        body: body,
      );

      return SentPix.fromMap(result.data!);
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
