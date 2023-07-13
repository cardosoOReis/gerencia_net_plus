import 'package:gerencia_net_plus/gerencia_net_plus.dart';

import 'base_credentials.dart';

Future<void> main(List<String> args) async {
  const gerenciaNetPlus = GerenciaNetPlus(
    credentials: GerenciaNetCredentials(
      clientId: 'Client_Id',
      clientSecret: 'Client_Secret',
      certificatePath: 'certificates/certificate.crt.pem',
      privateKeyPath: 'certificates/private_key.ke',
      pixKey: 'pixKey',
    ),
  );

  final newCharge = await gerenciaNetPlus.pix.immediateCharge.createCharge(
    value: 100,
  );

  final recievedPix = await gerenciaNetPlus.pix.transactions.listRecievedPix();
}
