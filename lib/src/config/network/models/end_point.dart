// Project imports:
import 'http_method.dart';

/// An endpoint with it's path and what HTTP method you should use in this
/// endpoint.
class EndPoint {
  /// endpoint path to make the HTTP request. Not the full URL.
  final String path;

  /// The method to use to make the HTTP request.
  final HttpMethod method;

  /// Default constructor.
  const EndPoint({
    required this.path,
    required this.method,
  });
}
