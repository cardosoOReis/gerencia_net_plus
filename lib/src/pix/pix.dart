import 'models/additional_info.dart';
import 'models/debtor.dart';

import '../config/http_client/gerencia_net_plus_pix_rest_client.dart';
import '../gerencia_net_credentials.dart';
import 'charge/models/pix_create_charge_response.dart';
import 'charge/pix_create_charge.dart';

class Pix {
  final GerenciaNetCredentials credentials;
  final GerenciaNetPlusPixRestClient client;

  const Pix({
    required this.credentials,
    required this.client,
  });

  Future<PixCreateChargeResponse> pixCreateCharge({
    required Duration expiration,
    required double value,
    String? txid,
    Debtor? debtor,
    String? payerSolicitation,
    List<AdditionalInfo> additionalInfo = const [],
  }) async {
    final pixCreateCharge = PixCreateCharge(client);

    return await pixCreateCharge(
      credentials: credentials,
      expiration: expiration,
      txid: txid,
      value: value,
      debtor: debtor,
      payerSolicitation: payerSolicitation,
      additionalInfo: additionalInfo,
    );
  }
}
