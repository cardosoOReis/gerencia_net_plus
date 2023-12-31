import 'package:gerencia_net_plus/gerencia_net_plus.dart';

import '../../base_credentials.dart';

Future<void> main(List<String> args) async {
  final gerenciaNetPlus = GerenciaNetPlus(credentials: baseCredentials);
  final result = await gerenciaNetPlus.pix.dueCharge.listDueCharges(
    start: DateTime.now().subtract(const Duration(days: 10)),
    end: DateTime.now().add(const Duration(days: 10)),
    status: ChargeStatus.active,
    pageSize: 5,
    pageNumber: 0,
  );

  print(result.toMap());
}
