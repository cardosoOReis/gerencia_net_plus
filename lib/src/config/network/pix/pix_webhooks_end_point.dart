// Project imports:
import '../models/end_point.dart';
import '../models/http_method.dart';

/// Endpoints of Webhooks operations.
class PixWebHookEndPoints {
  /// The base url of this endpoint.
  final String url;

  /// Endpoints of Webhooks operations.
  const PixWebHookEndPoints({
    required this.url,
  });

  static const _baseEndPoint = '/v2/webhook';

  /// Endpoint to config a [PixWebhook].
  EndPoint pixConfigWebhook(String pixKey) => EndPoint(
        path: '$url$_baseEndPoint/$pixKey',
        method: HttpMethod.put,
      );

  /// Endpoint to detail a [PixWebhook].
  EndPoint pixDetailWebhook(String pixKey) => EndPoint(
        path: '$url$_baseEndPoint/$pixKey',
        method: HttpMethod.get,
      );

  /// Endpoint to list [PixWebhook]s.
  EndPoint pixListWebhook() => EndPoint(
        path: '$url$_baseEndPoint',
        method: HttpMethod.get,
      );

  /// Endpoint to delete a [PixWebhook].
  EndPoint pixDeleteWebhook(String pixKey) => EndPoint(
        path: '$url$_baseEndPoint/$pixKey',
        method: HttpMethod.delete,
      );
}
