// Package imports:
import 'package:equatable/equatable.dart';

/// Authorization token for HTTP calls.
class Token extends Equatable {
  /// Authorization token to be used in the other requests made to the API.
  final String accessToken;

  /// Authorization type in which the [accessToken] should be used.
  ///
  /// Default: "Bearer".
  final String tokenType;

  /// Expiration time of the [accessToken] in seconds.
  ///
  /// Default: 3600.
  final Duration expiresIn;

  /// List of scopes to which the authorized application has access.
  /// The scopes are separated by spaces.
  final String scope;

  /// Default constructor.
  const Token({
    required this.accessToken,
    required this.tokenType,
    required this.expiresIn,
    required this.scope,
  });

  /// Handy method to convert from a Map<String, dynamic>.
  factory Token.fromMap(Map<String, dynamic> map) => Token(
        accessToken: map['access_token'] as String,
        tokenType: map['token_type'] as String,
        expiresIn: Duration(seconds: map['expires_in']),
        scope: map['scope'] as String,
      );

  @override
  List<Object> get props => [accessToken, tokenType, expiresIn, scope];
}
