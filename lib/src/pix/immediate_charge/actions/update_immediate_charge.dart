// Project imports:
import '../../../config/http_client/gerencia_net_plus_pix_rest_client.dart';
import '../../models/additional_info.dart';
import '../../models/charge_status.dart';
import '../models/debtor.dart';
import '../models/immediate_charge.dart';
import 'models/update_charge_request_body.dart';

class UpdateCharge {
  final GerenciaNetPlusPixRestClient client;

  const UpdateCharge(this.client);

  Future<ImmediateCharge> call({
    required String txid,
    required double? value,
    required int? locId,
    required Debtor? debtor,
    required String? payerSolicitation,
    required String? pixKey,
    required List<AdditionalInfo>? additionalInfo,
    required ChargeStatus? status,
    bool persist = true,
  }) async {
    final body = UpdateChargeRequestBody(
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

    return ImmediateCharge(response.data!);
  }
}
