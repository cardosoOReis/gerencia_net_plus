// Project imports:
import '../../../config/http_client/gerencia_net_plus_pix_rest_client.dart';
import '../../models/charge_type.dart';
import '../models/qr_code.dart';

/// Generates a QR Code associated with the given [locationId]
///
/// The [locationId] can be from a [ChargeType.immediateCharge] or a
/// [ChargeType.dueCharge], and will return an equivalent QR Code with the
/// charge associated with the [locationId].
///
/// Throws if the [locationId] doesn't have a charge binded to it.
class GenerateQrCode {
  final GerenciaNetPlusPixRestClient _client;

  /// Generates a QR Code associated with the given [locationId]
  ///
  /// The [locationId] can be from a [ChargeType.immediateCharge] or a
  /// [ChargeType.dueCharge], and will return an equivalent QR Code with the
  /// charge associated with the [locationId].
  ///
  /// Throws if the [locationId] doesn't have a charge binded to it.
  const GenerateQrCode(this._client);

  /// Generates a QR Code associated with the given [locationId]
  ///
  /// The [locationId] can be from a [ChargeType.immediateCharge] or a
  /// [ChargeType.dueCharge], and will return an equivalent QR Code with the
  /// charge associated with the [locationId].
  ///
  /// Throws if the [locationId] doesn't have a charge binded to it.
  Future<QrCode> call(int locationId) async {
    final endPoint = _client.pixEndPoints.qrCode.generateQrCode(locationId);

    final result = await _client<Map<String, dynamic>>(endPoint: endPoint);

    return QrCode.fromMap(result.data!);
  }
}
