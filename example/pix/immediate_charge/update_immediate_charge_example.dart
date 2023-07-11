import 'package:gerencia_net_plus/gerencia_net_plus.dart';
import 'package:gerencia_net_plus/src/pix/immediate_charge/models/debtor.dart';
import 'package:gerencia_net_plus/src/pix/models/charge_status.dart';

import '../../base_credentials.dart';

Future<void> main(List<String> args) async {
  final gerenciaNetPlus = GerenciaNetPlus(credentials: baseCredentials);
  final result = await gerenciaNetPlus.pix.immediateCharge.updateCharge(
    txid: '0b093a77c06040e3bd6b3fd477b95a06',
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
