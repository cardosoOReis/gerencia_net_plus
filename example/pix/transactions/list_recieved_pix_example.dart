import 'package:gerencia_net_plus/gerencia_net_plus.dart';

import '../../base_credentials.dart';

Future<void> main(List<String> args) async {
  final gerenciaNetPlus = GerenciaNetPlus(credentials: baseCredentials);

  final pix = await gerenciaNetPlus.pix.transactions.listRecievedPix(
    start: DateTime(2023),
    end: DateTime(2024),
    pageSize: 3,
    currentPage: 1,
  );

  print(pix.toMap());
}
