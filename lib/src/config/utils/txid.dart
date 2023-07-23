// Dart imports:
import 'dart:math';

/// The current package name.
///
/// Used to stylize the txid.
const packageName = 'GerenciaNetPlus';

/// A valid txid max length.
const txidMaxLength = 35;

/// A valid txid min length.
const txidMinLentgh = 26;

/// Allowed characters in a txid.
const allowedCharacters =
    'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';

/// Generates a valid random txid to be used in the requisitions.
///
/// A valid txid must be 26-35 characters long and only contain the values
/// a-z, A-Z, 0-9.
///
/// A valid txid regex is ^[a-zA-Z0-9]{26,35}$.
String generate() {
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

/// Txid validator.
///
/// A valid txid must be 26-35 characters long and only contain the values
/// a-z, A-Z, 0-9.
bool isValid(String txid) => RegExp(r'^[a-zA-Z0-9]{26,35}$').hasMatch(txid);
