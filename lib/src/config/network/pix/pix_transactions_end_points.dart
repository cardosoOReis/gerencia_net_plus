// Project imports:
import '../models/end_point.dart';
import '../models/http_method.dart';

class PixTransactionsEndPoints {
  final String url;

  const PixTransactionsEndPoints({required this.url});

  static const _baseEndPoint = '/v2/pix';
  static const _baseGnEndPoint = '/v2/gn/pix';

  EndPoint detailRecievedPix(String endToEndId) => EndPoint(
        path: '$url$_baseEndPoint/$endToEndId',
        method: HttpMethod.get,
      );
  EndPoint listReceivedPix() => EndPoint(
        path: '$url$_baseEndPoint',
        method: HttpMethod.get,
      );
  EndPoint sendPix(String id) => EndPoint(
        path: '$url$_baseGnEndPoint/$id',
        method: HttpMethod.put,
      );
  EndPoint detailSentPix(String endToEndId) => EndPoint(
        path: '$url$_baseGnEndPoint/enviados/$endToEndId',
        method: HttpMethod.get,
      );
  EndPoint listSentPix() => EndPoint(
        path: '$url$_baseGnEndPoint/enviados',
        method: HttpMethod.get,
      );
  EndPoint requestDevolution(String endToEndId, String devolutionId) =>
      EndPoint(
        path: '$url$_baseEndPoint/$endToEndId/devolucao/$devolutionId',
        method: HttpMethod.put,
      );
  EndPoint detailDevolution(String endToEndId, String devolutionId) => EndPoint(
        path: '$url$_baseEndPoint/$endToEndId/devolucao/$devolutionId',
        method: HttpMethod.get,
      );
}
