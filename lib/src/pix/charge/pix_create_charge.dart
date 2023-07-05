// Dart imports:

// Project imports:
import 'package:gerencia_net_plus/src/config/utils/txid.dart';
import 'package:gerencia_net_plus/src/pix/charge/models/pix_create_charge_request_body.dart';

import '../../config/http_client/gerencia_net_plus_pix_rest_client.dart';
import '../../gerencia_net_credentials.dart';
import '../models/additional_info.dart';
import '../models/debtor.dart';
import 'models/pix_charge.dart';

class PixCreateCharge {
  final GerenciaNetPlusPixRestClient client;

  const PixCreateCharge(this.client);

  Future<PixCharge> call({
    required GerenciaNetCredentials credentials,
    required Duration expiration,
    required double value,
    String? txid,
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
    final endPoint = client.pixEndPoints.charge.pixCreateCharge(
      txid ?? Txid.generate(),
    );

    final response = await client<Map<String, dynamic>>(
      endPoint: endPoint,
      body: body.toMap(),
    );
    return PixCharge(response.data!);
  }
}
