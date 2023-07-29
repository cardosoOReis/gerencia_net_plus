enum SentPixStatus {
  processing('EM_PROCESSAMENTO'),
  confirmed('REALIZADO'),
  rejected('NAO_REALIZADO');

  final String value;

  const SentPixStatus(this.value);

  factory SentPixStatus.match(String status) => SentPixStatus.values.firstWhere(
        (e) => e.value == status,
        orElse: () => throw ArgumentError.value(status),
      );
}
