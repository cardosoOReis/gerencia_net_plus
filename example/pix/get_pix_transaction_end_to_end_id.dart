import 'package:gerencia_net_plus/gerencia_net_plus.dart';

import '../base_credentials.dart';

Future<void> main(List<String> args) async {
  final gerenciaNetPlus = GerenciaNetPlus(credentials: baseCredentials);

  // In sandbox mode, charges between 0.01 and 10.00 are paid after 30 seconds.
  final newCharge = await gerenciaNetPlus.pix.immediateCharge.createCharge(
    value: 5,
  );

  // We wait for the charge to be paid.
  await Future.delayed(const Duration(seconds: 30));

  final payedCharge = await gerenciaNetPlus.pix.immediateCharge.detailCharge(
    newCharge.txid,
  );

  final endToEndId = payedCharge.pixPayments?.first.endToEndId;

  print(endToEndId);
}
