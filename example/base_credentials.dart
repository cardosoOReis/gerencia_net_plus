import 'dart:io';

import 'package:dotenv/dotenv.dart';
import 'package:gerencia_net_plus/src/gerencia_net_credentials.dart';

GerenciaNetCredentials get baseCredentials {
  final env = DotEnv(includePlatformEnvironment: true)..load();

  final certificateBytes = File(
    env.getOrElse('CERTIFICATE_PATH', () => ''),
  ).readAsBytesSync();

  final privateKeyBytes = File(
    env.getOrElse('PRIVATE_KEY_PATH', () => ''),
  ).readAsBytesSync();

  return GerenciaNetCredentials(
    clientId: env.getOrElse('CLIENT_ID', () => ''),
    clientSecret: env.getOrElse('CLIENT_SECRET', () => ''),
    certificateBytes: certificateBytes,
    privateKeyBytes: privateKeyBytes,
    pixKey: env.getOrElse('PIX_KEY', () => ''),
    sandbox: bool.tryParse(env.getOrElse('SANDBOX', () => 'true')) ?? true,
  );
}
