import 'dart:convert';

import 'package:equatable/equatable.dart';

class GerenciaNetCredentials extends Equatable {
  final String clientId;
  final String clientSecret;
  final bool sandbox;
  final String certificatePath;
  final String privateKeyPath;
  final String pixKey;
  final String? accountId;

  const GerenciaNetCredentials({
    required this.clientId,
    required this.clientSecret,
    required this.certificatePath,
    required this.privateKeyPath,
    required this.pixKey,
    this.sandbox = true,
    this.accountId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'clientId': clientId,
      'clientSecret': clientSecret,
      'sandbox': sandbox,
      'certificatePath': certificatePath,
      'privateKeyPath': privateKeyPath,
      'pixKey': pixKey,
      'accountId': accountId,
    };
  }

  factory GerenciaNetCredentials.fromMap(Map<String, dynamic> map) {
    return GerenciaNetCredentials(
      clientId: map['clientId'] as String,
      clientSecret: map['clientSecret'] as String,
      sandbox: map['sandbox'] as bool,
      certificatePath: map['certificatePath'] as String,
      privateKeyPath: map['privateKeyPath'] as String,
      pixKey: map['pixKey'] as String,
      accountId: map['accountId'] != null ? map['accountId'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GerenciaNetCredentials.fromJson(String source) =>
      GerenciaNetCredentials.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  List<Object?> get props {
    return [
      clientId,
      clientSecret,
      sandbox,
      certificatePath,
      privateKeyPath,
      pixKey,
      accountId,
    ];
  }
}
