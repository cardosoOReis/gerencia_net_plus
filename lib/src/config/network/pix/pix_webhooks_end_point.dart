// Project imports:
import '../models/end_point.dart';
import '../models/http_method.dart';

class PixWebHookEndPoints {
  final String url;

  const PixWebHookEndPoints({
    required this.url,
  });

  static const _baseEndPoint = '/v2/webhook';

  EndPoint pixConfigWebhook(String key) => EndPoint(
        path: '$url$_baseEndPoint/$key',
        method: HttpMethod.put,
      );

  EndPoint pixDetailWebhook(String key) => EndPoint(
        path: '$url$_baseEndPoint/$key',
        method: HttpMethod.get,
      );

  EndPoint pixListWebhook() => EndPoint(
        path: '$url$_baseEndPoint',
        method: HttpMethod.get,
      );

  EndPoint pixDeleteWebhook(String key) => EndPoint(
        path: '$url$_baseEndPoint/$key',
        method: HttpMethod.delete,
      );
}
