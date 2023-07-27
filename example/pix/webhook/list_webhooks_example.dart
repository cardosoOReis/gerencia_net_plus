import 'package:gerencia_net_plus/gerencia_net_plus.dart';

import '../../base_credentials.dart';

Future<void> main(List<String> args) async {
  final gerenciaNetPlus = GerenciaNetPlus(credentials: baseCredentials);

  final webhook = await gerenciaNetPlus.pix.webhook.listWebhooks(
    start: DateTime(2023),
    end: DateTime(2024),
    pageNumber: 0,
    pageSize: 0,
  );

  print(webhook.toMap());
}
