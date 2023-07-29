// Project imports:
import 'package:dio/dio.dart';

import '../../../config/http_client/gerencia_net_plus_pix_rest_client.dart';
import '../../../core/gerencia_net_exception.dart';
import '../../models/charge_type.dart';
import '../models/location_with_txid.dart';

class CreateLocation {
  final GerenciaNetPlusPixRestClient _client;

  const CreateLocation(this._client);

  Future<LocationInfoWithTxid> call({
    required ChargeType chargeType,
  }) async {
    final body = {
      'tipoCob': chargeType.value,
    };

    final endPoint = _client.pixEndPoints.location.createLocation();

    try {
      final result = await _client<Map<String, dynamic>>(
        endPoint: endPoint,
        body: body,
      );

      return LocationInfoWithTxid.fromMap(result.data!);
    } on DioException catch (e, s) {
      throw GerenciaNetException(
        title: e.response?.data['nome'],
        message: e.response?.data['mensagem'],
        statusCode: e.response?.statusCode,
        originalException: e,
        stackTrace: s,
      );
    }
  }
}
