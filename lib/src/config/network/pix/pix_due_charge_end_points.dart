// Project imports:
import '../models/end_point.dart';
import '../models/http_method.dart';

class PixDueChargeEndPoints {
  final String url;

  const PixDueChargeEndPoints({required this.url});

  static const _baseEndPoint = '/v2/cobv';

  EndPoint createDueCharge(String txid) => EndPoint(
        path: '$url$_baseEndPoint/$txid',
        method: HttpMethod.put,
      );

  EndPoint updateDueCharge(String txid) => EndPoint(
        path: '$url$_baseEndPoint/$txid',
        method: HttpMethod.patch,
      );

  EndPoint detailDueCharge(String txid) => EndPoint(
        path: '$url$_baseEndPoint/$txid',
        method: HttpMethod.get,
      );

  EndPoint listDueCharges() => EndPoint(
        path: '$url$_baseEndPoint',
        method: HttpMethod.get,
      );
}
