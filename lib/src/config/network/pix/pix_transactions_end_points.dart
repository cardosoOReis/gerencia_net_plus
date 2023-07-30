// Project imports:
import '../models/end_point.dart';
import '../models/http_method.dart';

/// Endpoints of [TransactionsOperations].
class PixTransactionsEndPoints {
  /// The base url of this endpoint.
  final String url;

  /// Endpoints of [TransactionsOperations].
  const PixTransactionsEndPoints({required this.url});

  static const _baseEndPoint = '/v2/pix';
  static const _baseGnEndPoint = '/v2/gn/pix';

  /// Endpoint to detail a [RecievedPix].
  EndPoint detailRecievedPix(String endToEndId) => EndPoint(
        path: '$url$_baseEndPoint/$endToEndId',
        method: HttpMethod.get,
      );

  /// Endpoint to list [RecievedPix].
  EndPoint listReceivedPix() => EndPoint(
        path: '$url$_baseEndPoint',
        method: HttpMethod.get,
      );
  
  /// Endpoint to send a Pix.
  EndPoint sendPix(String id) => EndPoint(
        path: '$url$_baseGnEndPoint/$id',
        method: HttpMethod.put,
      );
  /// Endpoint to detail a [SentPix].
  EndPoint detailSentPix(String endToEndId) => EndPoint(
        path: '$url$_baseGnEndPoint/enviados/$endToEndId',
        method: HttpMethod.get,
      );

  /// Endpoint to detail a [SentPix].
  EndPoint listSentPix() => EndPoint(
        path: '$url$_baseGnEndPoint/enviados',
        method: HttpMethod.get,
      );

  /// Endpoint to request a [Devolution].
  EndPoint requestDevolution(String endToEndId, String devolutionId) =>
      EndPoint(
        path: '$url$_baseEndPoint/$endToEndId/devolucao/$devolutionId',
        method: HttpMethod.put,
      );

  /// Endpoint to detail a [Devolution].
  EndPoint detailDevolution(String endToEndId, String devolutionId) => EndPoint(
        path: '$url$_baseEndPoint/$endToEndId/devolucao/$devolutionId',
        method: HttpMethod.get,
      );
}
