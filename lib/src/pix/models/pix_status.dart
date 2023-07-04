enum PixStatus {
  active,
  completed,
  removedByPayee,
  removedByPSP;

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
