enum PixStatus {
  active('ATIVA'),
  completed('CONCLUIDA'),
  removedByPayee('REMOVIDA_PELO_USUARIO_RECEBEDOR'),
  removedByPSP('REMOVIDA_PELO_PSP');

  final String value;

  const PixStatus(this.value);

  factory PixStatus.match(String value) => PixStatus.values.firstWhere(
        (status) => status.value == value,
        orElse: () => throw ArgumentError.value(value),
      );
}
