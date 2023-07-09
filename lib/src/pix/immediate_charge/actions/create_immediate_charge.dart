// Dart imports:

// Project imports:
import '../../../config/http_client/gerencia_net_plus_pix_rest_client.dart';
import '../../../config/utils/txid.dart';
import '../../../gerencia_net_credentials.dart';
import '../../models/additional_info.dart';
import '../models/debtor.dart';
import '../models/pix_create_charge_request_body.dart';
import '../models/pix_immediate_charge.dart';

class PixCreateCharge {
  final GerenciaNetPlusPixRestClient client;

  const PixCreateCharge(this.client);

  Future<PixImmediateCharge> call({
    required GerenciaNetCredentials credentials,
    required double value,
    Duration? expiration,
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
    final endPoint = client.pixEndPoints.immediateCharge.pixCreateCharge(
      txid ?? Txid.generate(),
    );

    final response = await client<Map<String, dynamic>>(
      endPoint: endPoint,
      body: body.toMap(),
    );
    return PixImmediateCharge(response.data!);
  }
}
