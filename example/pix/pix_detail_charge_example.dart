import 'package:gerencia_net_plus/gerencia_net_plus.dart';

import '../base_credentials.dart';

Future<void> main(List<String> args) async {
  final gerenciaNetPlus = GerenciaNetPlus(credentials: baseCredentials);
  final result = await gerenciaNetPlus.pix.immediateCharge.detailCharge(
    'GerenciaNetPlusxpwFQHHSXNB45Mt9mC66',
  );

  print(result.toMap());
}
