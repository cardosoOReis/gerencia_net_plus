import 'package:gerencia_net_plus/gerencia_net_plus.dart';

import '../../base_credentials.dart';

Future<void> main(List<String> args) async {
  final gerenciaNetPlus = GerenciaNetPlus(credentials: baseCredentials);

  final webhook = await gerenciaNetPlus.pix.webhook.configureWebhook(
    webhook: Uri.parse('https://webhookurl.com.br'),
  );

  print(webhook);
}
