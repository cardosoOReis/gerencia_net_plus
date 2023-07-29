import 'package:gerencia_net_plus/gerencia_net_plus.dart';

import '../../base_credentials.dart';

Future<void> main(List<String> args) async {
  final gerenciaNetPlus = GerenciaNetPlus(credentials: baseCredentials);

  final sentPix = await gerenciaNetPlus.pix.transactions.detailSentPix(
    'e2eId',
  );

  print(sentPix.toMap());
}
