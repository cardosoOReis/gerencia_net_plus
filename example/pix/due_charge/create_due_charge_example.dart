import 'package:gerencia_net_plus/gerencia_net_plus.dart';
import 'package:gerencia_net_plus/src/pix/due_charge/models/debtor_details.dart';

import '../../base_credentials.dart';

Future<void> main(List<String> args) async {
  final gerenciaNetPlus = GerenciaNetPlus(credentials: baseCredentials);
  await gerenciaNetPlus.pix.dueCharge.createDueCharge(
    dueDate: DateTime.now().add(const Duration(days: 45)),
    debtorDetails: const LegalDebtorDetails(
      name: 'Empresa de Serviços SA',
      cnpj: '12345678000195',
      email: 'email@email.com',
      adress: 'Alameda Souza, Numero 80, Bairro Braz',
      city: 'Recife',
      federativeUnit: 'PE',
      cep: '70011750',
    ),
    originalValue: 15,
    expiryDaysAfterExpiration: 45,
  );
}
