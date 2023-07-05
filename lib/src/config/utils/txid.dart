// Dart imports:
import 'dart:math';

class Txid {
  static String generate() {
    /// A valid txid must be 26-35 characters long and only contain a-z, A-Z, 0-9
    const packageName = 'GerenciaNetPlus';
    final random = Random.secure();
    final txidLength = 35;
    final allowedCharacters =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';

    final lastTxidCharacters = List.generate(
      txidLength - packageName.length,
      (_) {
        final index = random.nextInt(allowedCharacters.length);
        return allowedCharacters[index];
      },
    ).join();

    return '$packageName$lastTxidCharacters';
  }
}
