/// Default Exception class to treat any error that happens with the
/// GerenciaNetPlus library.
class GerenciaNetException implements Exception {
  /// The original exception being wrapped by the GerenciaNetException.
  final Exception originalException;

  /// The original stack trace being wrapped by the GerenciaNetException.
  final StackTrace stackTrace;

  /// The title of what could have happened in this exception.
  final String? title;

  /// The message and details of what could have happened in this exception.
  final String? message;

  /// The status code that happened in the call.
  final int? statusCode;

  /// Default Exception class to treat any error that happens with the
  /// GerenciaNetPlus library.
  const GerenciaNetException({
    required this.originalException,
    required this.stackTrace,
    this.title,
    this.message,
    this.statusCode,
  });
}
