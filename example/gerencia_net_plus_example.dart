// ignore_for_file: unused_local_variable

import 'package:gerencia_net_plus/gerencia_net_plus.dart';
import 'package:gerencia_net_plus/src/pix/models/additional_info.dart';

Future<void> main(List<String> args) async {
  final gerenciaNetPlus = GerenciaNetPlus(
    credentials: const GerenciaNetCredentials(
      clientId: 'Client_Id',
      clientSecret: 'Client_Secret',
      certificatePath: 'certificates/certificate.crt.pem',
      privateKeyPath: 'certificates/private_key.ke',
      pixKey: 'pixKey',
    ),
  );

  final newCharge = await gerenciaNetPlus.pix.immediateCharge.createCharge(
    value: 100,
    additionalInfo: const [
      AdditionalInfo(
        name: 'Local de Venda',
        value: 'Rua ABCD, Nº 20',
      )
    ],
  );

  final recievedPix = await gerenciaNetPlus.pix.transactions.listRecievedPix(
    start: DateTime(2023),
    end: DateTime(2024),
    cpf: '12345678909',
  );
}
