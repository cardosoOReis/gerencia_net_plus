// Project imports:
import 'package:gerencia_net_plus/src/config/http_client/gerencia_net_plus_pix_rest_client.dart';
import 'package:gerencia_net_plus/src/pix/charge/models/pix_charge_response.dart';

import '../../gerencia_net_credentials.dart';
import '../models/additional_info.dart';
import '../models/debtor.dart';
import 'models/pix_create_charge_request_body.dart';

class PixCreateImmediateCharge {
  final GerenciaNetPlusPixRestClient client;

  const PixCreateImmediateCharge(this.client);

  Future<PixChargeResponse> call({
    required GerenciaNetCredentials credentials,
    required Duration expiration,
    required double value,
    Debtor? debtor,
    String? payerSolicitation,
    List<AdditionalInfo> additionalInfo = const [],
  }) async {
    final body = PixCreateChargeRequestBody(
      credentials: credentials,
      expiration: expiration,
      value: value,
      debtor: debtor,
      payerSolicitation: payerSolicitation,
      additionalInfo: additionalInfo,
    );
    
    final endPoint = client.pixEndPoints.charge.pixCreateImmediateCharge();

    final response = await client<Map<String, dynamic>>(endPoint: endPoint, body: body.toMap());

    return PixChargeResponse(response.data!);
  }
}
