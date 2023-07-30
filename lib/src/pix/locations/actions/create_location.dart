// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import '../../../config/http_client/gerencia_net_plus_pix_rest_client.dart';
import '../../../core/gerencia_net_exception.dart';
import '../../models/charge_type.dart';
import '../models/location_with_txid.dart';

/// Creates a location with a specific [ChargeType].
///
/// After creating this location, it still won't have a charge associated with
/// it, you need to manually assign a charge to it. You can only associate
/// a charge with the same [ChargeType] as the location.
class CreateLocation {
  final GerenciaNetPlusPixRestClient _client;

  /// Creates a location with a specific [ChargeType].
  ///
  /// After creating this location, it still won't have a charge associated with
  /// it, you need to manually assign a charge to it. You can only associate
  /// a charge with the same [ChargeType] as the location.
  const CreateLocation(this._client);

  /// Creates a location with a specific [ChargeType].
  ///
  /// After creating this location, it still won't have a charge associated with
  /// it, you need to manually assign a charge to it. You can only associate
  /// a charge with the same [ChargeType] as the location.
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
