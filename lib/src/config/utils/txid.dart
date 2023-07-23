// Dart imports:
import 'dart:math';

/// The current package name.
///
/// Used to stylize the txid.
const _packageName = 'GerenciaNetPlus';

/// A valid txid max length.
const _txidMaxLength = 35;

/// Allowed characters in a txid.
const _allowedCharacters =
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
    _txidMaxLength - _packageName.length,
    (_) {
      final index = random.nextInt(_allowedCharacters.length);
      return _allowedCharacters[index];
    },
  ).join();

  return '$_packageName$lastTxidCharacters';
}

/// Txid validator.
///
/// A valid txid must be 26-35 characters long and only contain the values
/// a-z, A-Z, 0-9.
bool isValid(String txid) => RegExp(r'^[a-zA-Z0-9]{26,35}$').hasMatch(txid);
