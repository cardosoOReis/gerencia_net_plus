import 'http_method.dart';

class EndPoint {
  final String path;
  final HttpMethod method;
  const EndPoint({
    required this.path,
    required this.method,
  });
}
