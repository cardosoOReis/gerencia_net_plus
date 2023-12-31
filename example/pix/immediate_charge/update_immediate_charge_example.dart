import 'package:gerencia_net_plus/gerencia_net_plus.dart';

import '../../base_credentials.dart';

Future<void> main(List<String> args) async {
  final gerenciaNetPlus = GerenciaNetPlus(credentials: baseCredentials);
  final result = await gerenciaNetPlus.pix.immediateCharge.updateCharge(
    txid: 'txid',
    value: 50,
    debtor: const LegalPersonDebtor(
      name: 'Empresa de Serviços SA',
      cnpj: '12345678000195',
    ),
    status: ChargeStatus.removedByPayee,
    pixKey: 'ola',
  );

  print(result.toMap());
}
