import 'package:dotenv/dotenv.dart';
import 'package:gerencia_net_plus/src/gerencia_net_credentials.dart';

GerenciaNetCredentials get baseCredentials {
  final env = DotEnv(includePlatformEnvironment: true)..load();
  return GerenciaNetCredentials(
    clientId: env.getOrElse('CLIENT_ID', () => ''),
    clientSecret: env.getOrElse('CLIENT_SECRET', () => ''),
    certificatePath: env.getOrElse('CERTIFICATE_PATH', () => ''),
    privateKeyPath: env.getOrElse('PRIVATE_KEY_PATH', () => ''),
    pixKey: env.getOrElse('PIX_KEY', () => ''),
    sandbox: bool.tryParse(env.getOrElse('SANDBOX', () => 'true')) ?? true,
  );
}
