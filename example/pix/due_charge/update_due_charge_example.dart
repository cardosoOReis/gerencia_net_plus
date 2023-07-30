import 'package:gerencia_net_plus/gerencia_net_plus.dart';

import '../../base_credentials.dart';

Future<void> main(List<String> args) async {
  final gerenciaNetPlus = GerenciaNetPlus(credentials: baseCredentials);
  final dueCharge = await gerenciaNetPlus.pix.dueCharge.updateDueCharge(
    txid: 'txid',
    dueDate: DateTime.now().add(const Duration(days: 10)),
    debtorDetails: const LegalDebtorDetails(
      name: 'Empresa de Serviços SA',
      cnpj: '12345678000195',
      email: 'email@email.com',
      address: 'Alameda Souza, Numero 80, Bairro Braz',
      city: 'Recife',
      federativeUnit: 'PE',
      cep: '70011750',
    ).copyWith(
      name: 'Outro Nome',
      address: 'Outro Endereço',
    ),
    originalValue: 250,
    expiryDaysAfterExpiration: 35,
    additionalInfo: const [
      AdditionalInfo(name: 'Informação 3', value: 'Valor da informação 3'),
      AdditionalInfo(name: 'Informação 4', value: 'Valor da informação 4'),
    ],
    reduction: const DueChargeReduction(
      value: 5,
      modality: ReductionModality.fixedValue,
    ),
    fine: const DueChargeFine(
      value: 5,
      modality: DueChargeFineModality.fixedValue,
    ),
    payerSolicitation: 'Paga logo isso v2!',
  );

  print(dueCharge.toMap());
}
