// Project imports:
import '../../../config/http_client/gerencia_net_plus_pix_rest_client.dart';
import '../models/immediate_charge.dart';

class PixDetailCharge {
  final GerenciaNetPlusPixRestClient client;

  const PixDetailCharge(this.client);

  Future<ImmediateCharge> call({
    required String txid,
    int? revision,
  }) async {
    final endPoint = client.pixEndPoints.immediateCharge.pixDetailCharge(txid);
    final queryParameters = <String, dynamic>{};
    if (revision != null) {
      queryParameters.addAll({
        'revisao': revision,
      });
    }

    final result = await client<Map<String, dynamic>>(
      endPoint: endPoint,
      queryParameters: queryParameters,
    );

    return ImmediateCharge(result.data!);
  }
}
