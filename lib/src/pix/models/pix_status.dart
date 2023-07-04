enum PixStatus {
  active('ATIVA'),
  completed('CONCLUIDA'),
  removedByPayee('REMOVIDA_PELO_USUARIO_RECEBEDOR'),
  removedByPSP('REMOVIDA_PELO_PSP');

  final String value;

  const PixStatus(this.value);

  factory PixStatus.match(String value) {
    return switch (value.toUpperCase()) {
      'ATIVA' => PixStatus.active,
      'CONCLUIDA' => PixStatus.completed,
      'REMOVIDA_PELO_USUARIO_RECEBEDOR' => PixStatus.removedByPayee,
      'REMOVIDA_PELO_PSP' => PixStatus.removedByPSP,
      _ => throw UnimplementedError(value),
    };
  }
}
