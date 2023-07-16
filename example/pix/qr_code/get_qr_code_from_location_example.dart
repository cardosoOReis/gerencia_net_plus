import 'package:gerencia_net_plus/gerencia_net_plus.dart';

import '../../base_credentials.dart';

Future<void> main(List<String> args) async {
  final gerenciaNetPlus = GerenciaNetPlus(credentials: baseCredentials);

  final qrCode = await gerenciaNetPlus.pix.qrCode.getQrCodeFromLocation(4);

  print(qrCode.toMap());
}
