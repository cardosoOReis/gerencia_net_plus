import 'package:gerencia_net_plus/gerencia_net_plus.dart';
import 'package:gerencia_net_plus/src/pix/models/pix_status.dart';

import '../../base_credentials.dart';

Future<void> main(List<String> args) async {
  final gerenciaNetPlus = GerenciaNetPlus(credentials: baseCredentials);
  final result = await gerenciaNetPlus.pix.immediateCharge.listCharges(
    start: DateTime.now().subtract(const Duration(days: 1)),
    end: DateTime.now(),
    cnpj: '12345678000195',
    status: PixStatus.completed,
    itemAmount: 5,
    pageNumber: 0,
  );

  print(result.toMap());
}
