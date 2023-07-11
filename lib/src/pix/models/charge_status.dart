enum ChargeStatus {
  active('ATIVA'),
  completed('CONCLUIDA'),
  removedByPayee('REMOVIDA_PELO_USUARIO_RECEBEDOR'),
  removedByPSP('REMOVIDA_PELO_PSP');

  final String value;

  const ChargeStatus(this.value);

  factory ChargeStatus.match(String value) => ChargeStatus.values.firstWhere(
        (status) => status.value == value,
        orElse: () => throw ArgumentError.value(value),
      );
}
