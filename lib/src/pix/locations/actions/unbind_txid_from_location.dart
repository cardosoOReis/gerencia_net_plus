// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import '../../../config/http_client/gerencia_net_plus_pix_rest_client.dart';
import '../../../core/gerencia_net_exception.dart';
import '../../models/location_info.dart';

/// Unbinds the charge associated with the location's [id].
///
/// If the call is successful, the location won't have a txid associated with
/// it anymore. Additionally, the charge entity with the unbinded txid won't
/// have a location anymore. This operation doesn't change the [status] of the
/// [ImmediateCharge] or the [DueCharge].
class UnbindTxidFromLocation {
  final GerenciaNetPlusPixRestClient _client;

  /// Unbinds the charge associated with the location's [id].
  ///
  /// If the call is successful, the location won't have a txid associated with
  /// it anymore. Additionally, the charge entity with the unbinded txid won't
  /// have a location anymore. This operation doesn't change the [status] of the
  /// [ImmediateCharge] or the [DueCharge].
  const UnbindTxidFromLocation(this._client);

  /// Unbinds the charge associated with the location's [id].
  ///
  /// If the call is successful, the location won't have a txid associated with
  /// it anymore. Additionally, the charge entity with the unbinded txid won't
  /// have a location anymore. This operation doesn't change the [status] of the
  /// [ImmediateCharge] or the [DueCharge].
  Future<LocationInfo> call(int id) async {
    final endPoint = _client.pixEndPoints.location.unbindTxidFromLocation(id);

    try {
      final result = await _client<Map<String, dynamic>>(endPoint: endPoint);

      return LocationInfo.fromMap(result.data!);
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
