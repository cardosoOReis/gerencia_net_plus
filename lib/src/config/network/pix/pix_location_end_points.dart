// Project imports:
import '../models/end_point.dart';
import '../models/http_method.dart';

/// Endpoints of [LocationOperations].
class PixLocationEndPoints {
  /// The base url of this endpoint.
  final String url;

  /// Endpoints of [LocationOperations].
  const PixLocationEndPoints({required this.url});

  static const _baseEndPoint = '/v2/loc';

  /// Endpoint to create a [Location].
  EndPoint createLocation() => EndPoint(
        path: '$url$_baseEndPoint',
        method: HttpMethod.post,
      );

  /// Endpoint to list [Location]s.
  EndPoint listLocations() => EndPoint(
        path: '$url$_baseEndPoint',
        method: HttpMethod.get,
      );

  /// Endpoint to detail a [Location].
  EndPoint detailLocation(int id) => EndPoint(
        path: '$url$_baseEndPoint/$id',
        method: HttpMethod.get,
      );

  /// Endpoint to cancel a [Location].
  EndPoint unbindTxidFromLocation(int id) => EndPoint(
        path: '$url$_baseEndPoint/$id/txid',
        method: HttpMethod.delete,
      );
}
