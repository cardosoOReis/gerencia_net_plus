/// Represents either an [ImmediateCharge] or a [DueCharge].
enum ChargeType {
  /// Represents an [ImmediateCharge].
  immediateCharge('cob'),

  /// Represents a [DueCharge].
  dueCharge('cobv');

  /// The value that is returned from the GerenciaNet Api.
  final String value;

  const ChargeType(this.value);

  factory ChargeType.match(String chargeTypeValue) =>
      ChargeType.values.firstWhere(
        (chargeType) => chargeType.value == chargeTypeValue,
        orElse: () => throw ArgumentError.value(chargeTypeValue),
      );
}
