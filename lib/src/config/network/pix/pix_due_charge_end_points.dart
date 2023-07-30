// Project imports:
import '../models/end_point.dart';
import '../models/http_method.dart';

/// Endpoints of [DueChargeOperations].
class PixDueChargeEndPoints {
  /// The base url of this endpoint.
  final String url;

  /// Endpoints of [DueChargeOperations].
  const PixDueChargeEndPoints({required this.url});

  static const _baseEndPoint = '/v2/cobv';

  /// Endpoint to create a [DueCharge].
  EndPoint createDueCharge(String txid) => EndPoint(
        path: '$url$_baseEndPoint/$txid',
        method: HttpMethod.put,
      );

  /// Endpoint to update a [DueCharge].
  EndPoint updateDueCharge(String txid) => EndPoint(
        path: '$url$_baseEndPoint/$txid',
        method: HttpMethod.patch,
      );

  /// Endpoint to detail a [DueCharge].
  EndPoint detailDueCharge(String txid) => EndPoint(
        path: '$url$_baseEndPoint/$txid',
        method: HttpMethod.get,
      );

  /// Endpoint to list [DueCharge]s.
  EndPoint listDueCharges() => EndPoint(
        path: '$url$_baseEndPoint',
        method: HttpMethod.get,
      );
}
