import 'package:gerencia_net_plus/gerencia_net_plus.dart';

import '../../base_credentials.dart';

Future<void> main(List<String> args) async {
  final gerenciaNetPlus = GerenciaNetPlus(credentials: baseCredentials);
  final dueCharge = await gerenciaNetPlus.pix.dueCharge.createDueCharge(
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
    originalValue: 200,
    expiryDaysAfterExpiration: 45,
    additionalInfo: const [
      AdditionalInfo(name: 'Informação 1', value: 'Valor da informação 1'),
      AdditionalInfo(name: 'Informação 2', value: 'Valor da informação 2'),
    ],
    reduction: const DueChargeReduction(
      value: 10,
      modality: ReductionModality.percentageValue,
    ),
    fine: const DueChargeFine(
      value: 10,
      modality: DueChargeFineModality.percentageValue,
    ),
    interestRate: const DueChargeInterestRate(
      value: 10,
      modality: InterestRateModality.valueWorkingDays,
    ),
    discount: DueChargeDiscountUntilDate(
      modality: DueChargeDiscountUntilDateModality.percentageValue,
      dates: [
        (DateTime.now().add(const Duration(days: 20)), 10),
        (DateTime.now().add(const Duration(days: 30)), 10),
      ],
    ),
    payerSolicitation: 'Paga logo isso!',
  );

  print(dueCharge.toMap());
}
