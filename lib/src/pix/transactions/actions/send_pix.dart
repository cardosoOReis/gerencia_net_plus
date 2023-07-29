// Project imports:
import '../../../config/http_client/gerencia_net_plus_pix_rest_client.dart';
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

    final result = await _client<Map<String, dynamic>>(
      endPoint: endPoint,
      body: body,
    );

    return SentPix.fromMap(result.data!);
  }
}
