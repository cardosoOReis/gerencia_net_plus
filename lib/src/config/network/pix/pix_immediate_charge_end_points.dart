// Project imports:
import '../models/end_point.dart';
import '../models/http_method.dart';

class PixImmediateChargeEndPoints {
  final String url;

  const PixImmediateChargeEndPoints({
    required this.url,
  });

  static const _baseEndPoint = '/v2/cob';

  EndPoint pixCreateCharge(String txid) => EndPoint(
        path: '$url$_baseEndPoint/$txid',
        method: HttpMethod.put,
      );

  EndPoint pixCreateImmediateCharge() => EndPoint(
        path: '$url$_baseEndPoint',
        method: HttpMethod.post,
      );

  EndPoint pixDetailCharge(String txid) => EndPoint(
        path: '$url$_baseEndPoint/$txid',
        method: HttpMethod.get,
      );

  EndPoint pixUpdateCharge(String txid) => EndPoint(
        path: '$url$_baseEndPoint/$txid',
        method: HttpMethod.patch,
      );
  EndPoint pixListCharges() => EndPoint(
        path: '$url$_baseEndPoint',
        method: HttpMethod.get,
      );
}
