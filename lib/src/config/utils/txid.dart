// Dart imports:
import 'dart:math';

class Txid {
  /// Generates a valid random txid to be used in the requisitions
  ///
  /// A valid txid must be 26-35 characters long and only contain the values
  /// a-z, A-Z, 0-9
  ///
  /// A valid txid regex is ^[a-zA-Z0-9]{26,35}$
  static String generate() {
    const packageName = 'GerenciaNetPlus';
    const txidMaxLength = 35;
    const allowedCharacters =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';

    final random = Random.secure();

    final lastTxidCharacters = List.generate(
      txidMaxLength - packageName.length,
      (_) {
        final index = random.nextInt(allowedCharacters.length);
        return allowedCharacters[index];
      },
    ).join();

    return '$packageName$lastTxidCharacters';
  }
}
