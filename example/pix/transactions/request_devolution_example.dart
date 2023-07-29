import 'package:gerencia_net_plus/gerencia_net_plus.dart';

import '../../base_credentials.dart';

Future<void> main(List<String> args) async {
  final gerenciaNetPlus = GerenciaNetPlus(credentials: baseCredentials);

  final devolution = await gerenciaNetPlus.pix.transactions.requestDevolution(
    endToEndId: 'e2eId',
    value: 5,
  );

  print(devolution.toMap());
}
