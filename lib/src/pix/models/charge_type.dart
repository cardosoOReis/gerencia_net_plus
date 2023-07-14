enum ChargeType {
  immediateCharge('cob'),
  dueCharge('cobv');

  final String value;

  const ChargeType(this.value);

  factory ChargeType.match(String chargeTypeValue) =>
      ChargeType.values.firstWhere(
        (chargeType) => chargeType.value == chargeTypeValue,
        orElse: () => throw ArgumentError.value(chargeTypeValue),
      );
}
