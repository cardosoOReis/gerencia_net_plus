// Dart imports:
import 'dart:typed_data';

// Package imports:
import 'package:equatable/equatable.dart';

/// Account credentials to connect to the GerenciaNet Api.
///
/// To get your's account credentials:
///
/// - Pix: https://dev.gerencianet.com.br/docs/api-pix-autenticacao-e-seguranca;
///
/// - BillPayment: https://dev.gerencianet.com.br/docs/api-pagamentos;
///
/// - OpenFinance: https://dev.gerencianet.com.br/docs/credenciais-certificado-e-autoriza%C3%A7%C3%A3o;
class GerenciaNetCredentials extends Equatable {
  /// Your application's Client_Id.
  final String clientId;

  /// Your application's Client_Secret.
  final String clientSecret;

  /// Wheter it's a sandbox/testing enviroment.
  ///
  /// If this field is set to true, this package will connect to the testing
  /// servers. If this field is false, it will connect to the production
  /// servers.
  ///
  /// If a service doesn't have a testing or production server, it will connect
  /// to the other one available.
  final bool sandbox;

  /// Your application's .pem certificate bytes.
  ///
  /// To use the GerenciaNet Api in Flutter/Dart, is necessary to convert
  /// your appliation certificate from a .p12 file to a .pem file.
  ///
  /// To convert your .p12 file to a .pem, follow the instructions here:
  /// https://dev.gerencianet.com.br/docs/dart#convertendo-o-certificado-p12.
  ///
  /// After converting the file to a .pem, I recommend you to create, in the
  /// root directory of your project, a 'certificates/' folder to store your application certificates.
  /// Also, add the certificates folder to your .gitignore file.
  ///
  /// Put your certificates there, load it's bytes to memory, and pass them to
  /// this field.
  ///
  /// Let's suppose your file structure is like this:
  /// ```bash
  /// ├── certificates
  /// │   ├── my_application_certificate.cert.pem
  /// ├── lib
  /// │   ├── src
  /// │   ├── main.dart
  /// ```
  ///
  /// ## If you are using Flutter
  ///
  /// If you are using Flutter with this library, follow this method to load
  /// your certificate bytes into the appliation.
  ///
  /// Inside your pubspec.yaml file, add in your assets options:
  /// ```yaml
  /// flutter:
  ///   assets:
  ///     - certificates/
  /// ```
  ///
  /// And load the certificate file bytes using `rootBundle`:
  ///
  /// ```dart
  /// import 'package:flutter/services.dart' show rootBundle;
  ///
  /// final certificateBytes = await rootBundle
  ///     .load('certificates/my_application_certificate.cert.pem')
  ///     .then((byteData) => byteData.buffer.asUint8List());
  /// ```
  ///
  /// After this, pass the bytes to the constructor like this:
  ///
  /// ```dart
  /// certificateBytes: certificateBytes,
  /// ```
  ///
  /// ## If you are using only Dart
  ///
  /// If this is a Dart project only, without Flutter, follow these steps.
  ///
  /// Load the certificate using the [File] class, and get the file bytes using
  /// the [readAsBytesSync()].
  ///
  /// ```dart
  /// final certificateBytes =
  ///     File('certificates/my_application_certificate.crt.pem').readAsBytesSync();
  /// ```
  ///
  /// After this, pass the bytes to the constructor like this:
  ///
  /// ```dart
  /// certificateBytes: certificateBytes,
  /// ```
  ///
  final Uint8List certificateBytes;

  /// Your application's .pem private key bytes.
  ///
  /// To use the GerenciaNet Api in Flutter/Dart, it is necessary to extract,
  /// from the .p12 certificate, the private key of your certificate.
  ///
  /// To extract the private key from your .p12 certificate, follow this
  /// instructions: https://dev.gerencianet.com.br/docs/dart#convertendo-o-certificado-p12.
  ///
  /// After extracting the private key to a .pem file, I recommend you to
  /// create, in the root directory of your project, a 'certificates/' folder to store
  /// your application private keys.
  ///
  /// Also, add the certificates folder to your .gitignore file.
  ///
  /// Put your private key there, load it's bytes to memory, and pass them to
  /// this field.
  ///
  /// Let's suppose your file structure is like this:
  ///
  /// ```bash
  /// ├── certificates
  /// │   ├── my_application_private_key.key.pem
  /// ├── lib
  /// │   ├── src
  /// │   ├── main.dart
  /// ```
  ///
  /// ## If you are using Flutter
  ///
  /// If you are using Flutter with this library, follow this method to load
  /// your certificate bytes into the appliation.
  ///
  /// Inside your pubspec.yaml file, add in your assets options:
  /// ```yaml
  /// flutter:
  ///   assets:
  ///     - certificates/
  /// ```
  ///
  /// And load the certificate file bytes using `rootBundle`:
  ///
  /// ```dart
  /// import 'package:flutter/services.dart' show rootBundle;
  ///
  /// final certificateBytes = await rootBundle
  ///     .load('certificates/my_application_private_key.key.pem')
  ///     .then((byteData) => byteData.buffer.asUint8List());
  /// ```
  ///
  /// After this, pass the bytes to the constructor like this:
  ///
  /// ```dart
  /// privateKeyBytes: privateKeyBytes,
  /// ```
  ///
  /// ## If you are using only Dart
  ///
  /// If this is a Dart project only, without Flutter, follow these steps.
  ///
  /// Load the certificate using the [File] class, and get the file bytes using
  /// the [readAsBytesSync()].
  ///
  /// ```dart
  /// final privateKeyBytes =
  ///     File('certificates/my_application_private_key.key.pem').readAsBytesSync();
  /// ```
  ///
  /// After this, pass the bytes to the constructor like this:
  ///
  /// ```dart
  /// privateKeyBytes: privateKeyBytes,
  /// ```
  ///
  final Uint8List privateKeyBytes;

  /// One of the Pix keys registered in your GerenciaNet account.
  ///
  /// The key can be either one of:
  /// - Cpf;
  /// - Email;
  /// - Phone number;
  /// - EVP / Random key.
  final String pixKey;

  /// Account credentials to connect to the GerenciaNet Api.
  ///
  /// To get your's account credentials:
  ///
  /// - Pix: https://dev.gerencianet.com.br/docs/api-pix-autenticacao-e-seguranca;
  ///
  /// - BillPayment: https://dev.gerencianet.com.br/docs/api-pagamentos;
  ///
  /// - OpenFinance: https://dev.gerencianet.com.br/docs/credenciais-certificado-e-autoriza%C3%A7%C3%A3o;
  const GerenciaNetCredentials({
    required this.clientId,
    required this.clientSecret,
    required this.certificateBytes,
    required this.privateKeyBytes,
    required this.pixKey,
    this.sandbox = true,
  });

  /// Account credentials to connect to the GerenciaNet Api.
  ///
  /// To get your's account credentials:
  ///
  /// - Pix: https://dev.gerencianet.com.br/docs/api-pix-autenticacao-e-seguranca;
  ///
  /// - BillPayment: https://dev.gerencianet.com.br/docs/api-pagamentos;
  ///
  /// - OpenFinance: https://dev.gerencianet.com.br/docs/credenciais-certificado-e-autoriza%C3%A7%C3%A3o;
  ///
  /// This is a helper constructor to create in a sandbox enviroment.
  const GerenciaNetCredentials.sandbox({
    required this.clientId,
    required this.clientSecret,
    required this.certificateBytes,
    required this.privateKeyBytes,
    required this.pixKey,
  }) : sandbox = true;

  /// Account credentials to connect to the GerenciaNet Api.
  ///
  /// To get your's account credentials:
  ///
  /// - Pix: https://dev.gerencianet.com.br/docs/api-pix-autenticacao-e-seguranca;
  ///
  /// - BillPayment: https://dev.gerencianet.com.br/docs/api-pagamentos;
  ///
  /// - OpenFinance: https://dev.gerencianet.com.br/docs/credenciais-certificado-e-autoriza%C3%A7%C3%A3o;
  ///
  /// This is a helper constructor to create in a production enviroment.
  const GerenciaNetCredentials.production({
    required this.clientId,
    required this.clientSecret,
    required this.certificateBytes,
    required this.privateKeyBytes,
    required this.pixKey,
  }) : sandbox = false;

  /// Helper method to transform this class into a Map
  Map<String, dynamic> toMap() => <String, dynamic>{
        'clientId': clientId,
        'clientSecret': clientSecret,
        'sandbox': sandbox,
        'certificatePath': certificateBytes,
        'privateKeyPath': privateKeyBytes,
        'pixKey': pixKey,
      };

  /// Helper constructor to instantiate this class from a Map
  factory GerenciaNetCredentials.fromMap(Map<String, dynamic> map) =>
      GerenciaNetCredentials(
        clientId: map['clientId'] as String,
        clientSecret: map['clientSecret'] as String,
        sandbox: map['sandbox'] as bool,
        certificateBytes: map['certificatePath'] as Uint8List,
        privateKeyBytes: map['privateKeyPath'] as Uint8List,
        pixKey: map['pixKey'] as String,
      );

  @override
  List<Object> get props => [
        clientId,
        clientSecret,
        sandbox,
        certificateBytes,
        privateKeyBytes,
        pixKey,
      ];
}
