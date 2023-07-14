class GerenciaNetException implements Exception {
  final String title;
  final String message;
  final int statusCode;
  final List<String>? violations;
  final Exception originalException;
  final StackTrace stackTrace;

  const GerenciaNetException({
    required this.title,
    required this.message,
    required this.statusCode,
    required this.originalException,
    required this.stackTrace,
    this.violations,
  });
}
