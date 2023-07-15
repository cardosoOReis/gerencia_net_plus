import 'package:gerencia_net_plus/gerencia_net_plus.dart';
import 'package:gerencia_net_plus/src/core/gerencia_net_exception.dart';
import 'package:gerencia_net_plus/src/pix/immediate_charge/models/debtor.dart';
import 'package:gerencia_net_plus/src/pix/models/additional_info.dart';

import '../../base_credentials.dart';

Future<void> main(List<String> args) async {
  final gerenciaNetPlus = GerenciaNetPlus(credentials: baseCredentials);
  try {
    final result = await gerenciaNetPlus.pix.immediateCharge.createCharge(
      expiration: const Duration(days: 1),
      value: 10,
      debtor: const LegalPersonDebtor(
        name: 'Empresa de Serviços SA',
        cnpj: '12345678000195',
      ),
      payerSolicitation: 'Informe o número ou identificador do pedido.',
      additionalInfo: const [
        AdditionalInfo(
          name: 'Campo 1',
          value: 'informação adicional 1 do PSP-Recebedor',
        ),
        AdditionalInfo(
          name: 'Campo 2',
          value: 'informação adicional 2 do PSP-Recebedor',
        ),
      ],
    );
    print(result.toMap());
  } on GerenciaNetException catch (e) {
    print(e.message);
  }
}
