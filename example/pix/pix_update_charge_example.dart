import 'package:gerencia_net_plus/gerencia_net_plus.dart';
import 'package:gerencia_net_plus/src/pix/models/debtor.dart';
import 'package:gerencia_net_plus/src/pix/models/pix_status.dart';

import '../base_credentials.dart';

Future<void> main(List<String> args) async {
  final gerenciaNetPlus = GerenciaNetPlus(credentials: baseCredentials);
  final result = await gerenciaNetPlus.pix.updateCharge(
    txid: '0b093a77c06040e3bd6b3fd477b95a06',
    value: 50,
    debtor: LegalPersonDebtor(
      name: 'Empresa de Serviços SA',
      cnpj: '12345678000195',
    ),
    status: PixStatus.removedByPayee,
    pixKey: 'ola',
  );

  print(result.toMap());
}