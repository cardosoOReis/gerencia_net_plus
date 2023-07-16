import 'package:gerencia_net_plus/gerencia_net_plus.dart';
import 'package:gerencia_net_plus/src/pix/transactions/models/payee_details.dart';

import '../../base_credentials.dart';

Future<void> main(List<String> args) async {
  final gerenciaNetPlus = GerenciaNetPlus(credentials: baseCredentials);

  await gerenciaNetPlus.pix.transactions.sendPix(
    value: 21,
    payeeDetails: const PixKeyPayeeDetails(pixKey: 'efipay@sejaefi.com.br'),
  );
}
