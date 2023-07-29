/// Represents the status of a sent Pix transaction.
enum SentPixStatus {
  /// The Pix transaction is currently being processed.
  processing('EM_PROCESSAMENTO'),

  /// The Pix transaction has been successfully confirmed and executed.
  confirmed('REALIZADO'),

  /// The Pix transaction has been rejected and not executed.
  rejected('NAO_REALIZADO');

  /// The string value associated with each enum constant.
  final String value;

  /// Represents the status of a sent Pix transaction.
  const SentPixStatus(this.value);

  /// Handy method to convert a status from a string into a enum.
  factory SentPixStatus.match(String status) => SentPixStatus.values.firstWhere(
        (e) => e.value == status,
        orElse: () => throw ArgumentError.value(status),
      );
}
