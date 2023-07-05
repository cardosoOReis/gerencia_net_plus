import 'package:gerencia_net_plus/src/config/http_client/gerencia_net_plus_pix_rest_client.dart';
import 'package:gerencia_net_plus/src/pix/charge/models/pix_charge.dart';
import 'package:gerencia_net_plus/src/pix/models/additional_info.dart';
import 'package:gerencia_net_plus/src/pix/models/debtor.dart';
import 'package:gerencia_net_plus/src/pix/models/pix_status.dart';

import 'models/pix_update_charge_request_body.dart';

class PixUpdateCharge {
  final GerenciaNetPlusPixRestClient client;

  const PixUpdateCharge(this.client);

  Future<PixCharge> call({
    required String txid,
    bool persist = true,
    required double? value,
    required int? locId,
    required Debtor? debtor,
    required String? payerSolicitation,
    required String? pixKey,
    required List<AdditionalInfo>? additionalInfo,
    required PixStatus? status,
  }) async {
    final body = PixUpdateChargeRequestBody(
      locId: locId,
      value: value,
      debtor: debtor,
      payerSolicitation: payerSolicitation,
      pixKey: pixKey,
      additionalInfo: additionalInfo,
      status: status,
    );

    final endPoint = client.pixEndPoints.charge.pixUpdateCharge(txid);

    final response = await client<Map<String, dynamic>>(
        endPoint: endPoint,
        body: body.toMap(
          persist: persist,
        ));

    return PixCharge(response.data!);
  }
}
