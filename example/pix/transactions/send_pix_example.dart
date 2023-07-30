import 'package:gerencia_net_plus/gerencia_net_plus.dart';

import '../../base_credentials.dart';

Future<void> main(List<String> args) async {
  final gerenciaNetPlus = GerenciaNetPlus(credentials: baseCredentials);

  final pix = await gerenciaNetPlus.pix.transactions.sendPix(
    value: 4,
    payeeDetails: const PixKeyPayeeDetails(pixKey: 'efipay@sejaefi.com.br'),
    payerInfo: 'Segue o pagamento da conta',
  );

  print(pix.toMap());
}
