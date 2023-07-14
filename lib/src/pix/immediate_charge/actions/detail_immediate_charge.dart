// Project imports:
import '../../../config/http_client/gerencia_net_plus_pix_rest_client.dart';
import '../models/immediate_charge.dart';

/// Detail an immediate charge.
class DetailCharge {
  final GerenciaNetPlusPixRestClient _client;

  /// Default constructor.
  const DetailCharge(this._client);

  /// Details an Immediate Charge with the given [txid].
  ///
  /// Optionally, you can specify the [revision] parameter to retrieve a
  /// specific revision of the charge. If provided, the function will return
  /// the charge as it existed at the specified revision. If no revision is
  /// specified, the function will return the most recent version of the charge.
  Future<ImmediateCharge> call({
    required String txid,
    int? revision,
  }) async {
    final endPoint = _client.pixEndPoints.immediateCharge.pixDetailCharge(txid);
    final queryParameters = <String, dynamic>{};
    if (revision != null) {
      queryParameters.addAll({
        'revisao': revision,
      });
    }

    final result = await _client<Map<String, dynamic>>(
      endPoint: endPoint,
      queryParameters: queryParameters,
    );

    return ImmediateCharge.fromMap(result.data!);
  }
}
