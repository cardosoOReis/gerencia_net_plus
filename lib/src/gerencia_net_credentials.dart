// Dart imports:
import 'dart:convert';

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

  /// The path to the .pem certificate of your application.
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
  /// Put your certificates there, and pass it's relative path to this field.
  ///
  /// Let's suppose your file structure is like this:
  /// ```
  /// |-- certificates
  ///     |-- my_application_certificate.cert.pem
  /// |-- lib
  ///     |-- my_project.dart
  /// ```
  ///
  /// You should pass it's path like:
  ///
  /// ```
  /// certificatePath: 'certificates/my_application_certificate.cert.pem'
  /// ```
  final String certificatePath;

  /// The path to the .pem private key of your application.
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
  /// Put your private key there, and pass it's relative path to this field.
  ///
  /// Let's suppose your file structure is like this:
  /// ```
  /// |-- certificates
  ///     |-- my_application_private_key.key.pem
  /// |-- lib
  ///     |-- my_project.dart
  /// ```
  ///
  /// You should pass it's path like:
  ///
  /// ```
  /// privateKeyPath: 'certificates/my_application_private_key.key.pem'
  /// ```
  final String privateKeyPath;

  /// One of the Pix keys registered in your GerenciaNet account.
  ///
  /// The key can be either one of:
  /// - Cpf;
  /// - Email;
  /// - Phone number;
  /// - EVP / Random key.
  final String pixKey;

  /// Default constructor
  const GerenciaNetCredentials({
    required this.clientId,
    required this.clientSecret,
    required this.certificatePath,
    required this.privateKeyPath,
    required this.pixKey,
    this.sandbox = true,
  });

  /// Helper method to transform this class into a Map
  Map<String, dynamic> toMap() => <String, dynamic>{
        'clientId': clientId,
        'clientSecret': clientSecret,
        'sandbox': sandbox,
        'certificatePath': certificatePath,
        'privateKeyPath': privateKeyPath,
        'pixKey': pixKey,
      };

  /// Helper constructor to instantiate this class from a Map
  factory GerenciaNetCredentials.fromMap(Map<String, dynamic> map) =>
      GerenciaNetCredentials(
        clientId: map['clientId'] as String,
        clientSecret: map['clientSecret'] as String,
        sandbox: map['sandbox'] as bool,
        certificatePath: map['certificatePath'] as String,
        privateKeyPath: map['privateKeyPath'] as String,
        pixKey: map['pixKey'] as String,
      );

  /// Helper method to transform this class into a JSON String
  String toJson() => json.encode(toMap());

  /// Helper constructor to instantiate this class from a JSON String
  factory GerenciaNetCredentials.fromJson(String source) =>
      GerenciaNetCredentials.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  List<Object> get props => [
        clientId,
        clientSecret,
        sandbox,
        certificatePath,
        privateKeyPath,
        pixKey,
      ];
}
