/// The current status of the charge.
enum ChargeStatus {
  /// The charge is active. Payments can still be made to it.
  active('ATIVA'),

  /// A payment has already been made to this charge. Payments can no longer be
  /// made to it.
  completed('CONCLUIDA'),

  /// The user that created this charge has removed it. Payments can no longer
  /// be made to this charge.
  removedByPayee('REMOVIDA_PELO_USUARIO_RECEBEDOR'),

  /// The financial institution responsible to create the charge has removed it.
  /// Payments can no longer be made to this charge.
  removedByPSP('REMOVIDA_PELO_PSP');

  final String value;

  const ChargeStatus(this.value);

  factory ChargeStatus.match(String value) => ChargeStatus.values.firstWhere(
        (status) => status.value == value,
        orElse: () => throw ArgumentError.value(value),
      );
}
