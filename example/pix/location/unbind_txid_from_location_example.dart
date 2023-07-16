import 'package:gerencia_net_plus/gerencia_net_plus.dart';

import '../../base_credentials.dart';

Future<void> main(List<String> args) async {
  final gerenciaNetPlus = GerenciaNetPlus(credentials: baseCredentials);

  final location = await gerenciaNetPlus.pix.location.unbindTxidFromLocation(1);

  print(location.toMap());
}
