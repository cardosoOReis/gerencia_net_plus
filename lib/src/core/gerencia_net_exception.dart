/// Default Exception class to treat any error that happens with the
/// GerenciaNetPlus library.
class GerenciaNetException implements Exception {
  final Exception originalException;
  final StackTrace stackTrace;
  final String? title;
  final String? message;
  final int? statusCode;
  final List<String>? violations;

  const GerenciaNetException({
    required this.originalException,
    required this.stackTrace,
    this.title,
    this.message,
    this.statusCode,
    this.violations,
  });
}
