// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:equatable/equatable.dart';

class Token extends Equatable {
  final String accessToken;
  final String tokenType;
  final Duration expiresIn;
  final String scope;

  const Token({
    required this.accessToken,
    required this.tokenType,
    required this.expiresIn,
    required this.scope,
  });

  Map<String, dynamic> toMap() => <String, dynamic>{
        'accessToken': accessToken,
        'tokenType': tokenType,
        'expiresIn': expiresIn.inMilliseconds,
        'scope': scope,
      };

  factory Token.fromMap(Map<String, dynamic> map) => Token(
        accessToken: map['access_token'] as String,
        tokenType: map['token_type'] as String,
        expiresIn: Duration(milliseconds: map['expires_in']),
        scope: map['scope'] as String,
      );

  String toJson() => json.encode(toMap());

  factory Token.fromJson(String source) =>
      Token.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object> get props => [accessToken, tokenType, expiresIn, scope];
}
