// Project imports:
import '../models/end_point.dart';
import '../models/http_method.dart';

class PixLocationEndPoints {
  final String url;

  const PixLocationEndPoints({required this.url});

  static const _baseEndPoint = '/v2/loc';

  EndPoint createLocation() => EndPoint(
        path: '$url$_baseEndPoint',
        method: HttpMethod.post,
      );
  EndPoint listLocations() => EndPoint(
        path: '$url$_baseEndPoint',
        method: HttpMethod.get,
      );
  EndPoint detailLocation(int id) => EndPoint(
        path: '$url$_baseEndPoint/$id',
        method: HttpMethod.get,
      );
  EndPoint unbindTxidFromLocation(String txid) => EndPoint(
        path: '$url$_baseEndPoint/$txid/txid',
        method: HttpMethod.delete,
      );
}
