// Project imports:
import '../../../config/http_client/gerencia_net_plus_pix_rest_client.dart';
import '../../models/additional_info.dart';
import '../../models/pix_status.dart';
import '../models/debtor.dart';
import '../models/pix_immediate_charge.dart';
import '../models/pix_update_charge_request_body.dart';

class PixUpdateCharge {
  final GerenciaNetPlusPixRestClient client;

  const PixUpdateCharge(this.client);

  Future<PixImmediateCharge> call({
    required String txid,
    required double? value,
    required int? locId,
    required Debtor? debtor,
    required String? payerSolicitation,
    required String? pixKey,
    required List<AdditionalInfo>? additionalInfo,
    required PixStatus? status,
    bool persist = true,
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

    final endPoint = client.pixEndPoints.immediateCharge.pixUpdateCharge(txid);

    final response = await client<Map<String, dynamic>>(
      endPoint: endPoint,
      body: body.toMap(
        persist: persist,
      ),
    );

    return PixImmediateCharge(response.data!);
  }
}
