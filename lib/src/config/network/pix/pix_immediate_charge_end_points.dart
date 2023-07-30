// Project imports:
import '../models/end_point.dart';
import '../models/http_method.dart';

/// Endpoints of [ImmediateChargeOperations].
class PixImmediateChargeEndPoints {
  /// The base url of this endpoint.
  final String url;

  /// Endpoints of [ImmediateChargeOperations].
  const PixImmediateChargeEndPoints({
    required this.url,
  });

  static const _baseEndPoint = '/v2/cob';

  /// Endpoint to create an [ImmediateCharge].
  EndPoint pixCreateCharge(String txid) => EndPoint(
        path: '$url$_baseEndPoint/$txid',
        method: HttpMethod.put,
      );

  /// Endpoint to detail an [ImmediateCharge].
  EndPoint pixDetailCharge(String txid) => EndPoint(
        path: '$url$_baseEndPoint/$txid',
        method: HttpMethod.get,
      );

  /// Endpoint to update an [ImmediateCharge].
  EndPoint pixUpdateCharge(String txid) => EndPoint(
        path: '$url$_baseEndPoint/$txid',
        method: HttpMethod.patch,
      );

  /// Endpoint to list [ImmediateCharge].
  EndPoint pixListCharges() => EndPoint(
        path: '$url$_baseEndPoint',
        method: HttpMethod.get,
      );
}
