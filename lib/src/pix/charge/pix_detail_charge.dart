// Project imports:
import '../../config/http_client/gerencia_net_plus_pix_rest_client.dart';
import 'models/pix_charge.dart';

class PixDetailCharge {
  final GerenciaNetPlusPixRestClient client;

  const PixDetailCharge(this.client);

  Future<PixCharge> call({
    required String txid,
    int? revision,
  }) async {
    final endPoint = client.pixEndPoints.charge.pixDetailCharge(txid);
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

    return PixCharge(result.data!);
  }
}
