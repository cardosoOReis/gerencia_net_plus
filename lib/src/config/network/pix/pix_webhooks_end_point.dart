// Project imports:
import '../models/end_point.dart';
import '../models/http_method.dart';

class PixWebHookEndPoints {
  final String url;

  const PixWebHookEndPoints({
    required this.url,
  });

  static const _baseEndPoint = '/v2/webhook';

  EndPoint pixConfigWebhook(String pixKey) => EndPoint(
        path: '$url$_baseEndPoint/$pixKey',
        method: HttpMethod.put,
      );

  EndPoint pixDetailWebhook(String pixKey) => EndPoint(
        path: '$url$_baseEndPoint/$pixKey',
        method: HttpMethod.get,
      );

  EndPoint pixListWebhook() => EndPoint(
        path: '$url$_baseEndPoint',
        method: HttpMethod.get,
      );

  EndPoint pixDeleteWebhook(String pixKey) => EndPoint(
        path: '$url$_baseEndPoint/$pixKey',
        method: HttpMethod.delete,
      );
}
