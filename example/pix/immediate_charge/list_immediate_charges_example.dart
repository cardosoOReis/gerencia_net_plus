import 'package:gerencia_net_plus/gerencia_net_plus.dart';

import '../../base_credentials.dart';

Future<void> main(List<String> args) async {
  final gerenciaNetPlus = GerenciaNetPlus(credentials: baseCredentials);
  final result = await gerenciaNetPlus.pix.immediateCharge.listCharges(
    start: DateTime(2023, 7),
    end: DateTime(2024),
    cnpj: '12345678000195',
    status: ChargeStatus.completed,
    itemAmount: 5,
    pageNumber: 0,
  );

  print(result.toMap());
}
