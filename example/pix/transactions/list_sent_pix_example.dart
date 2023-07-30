import 'package:gerencia_net_plus/gerencia_net_plus.dart';

import '../../base_credentials.dart';

Future<void> main(List<String> args) async {
  final gerenciaNetPlus = GerenciaNetPlus(credentials: baseCredentials);

  final pix = await gerenciaNetPlus.pix.transactions.listSentPix(
    start: DateTime(2023),
    end: DateTime(2024),
    status: SentPixStatus.confirmed,
    hasDevolution: false,
    pageNumber: 10,
    pageSize: 5,
  );

  print(pix.toMap());
}
