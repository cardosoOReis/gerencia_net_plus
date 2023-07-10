import 'package:gerencia_net_plus/gerencia_net_plus.dart';
import 'package:gerencia_net_plus/src/pix/due_charge/models/debtor_details.dart';
import 'package:gerencia_net_plus/src/pix/due_charge/models/due_charge_fine.dart';
import 'package:gerencia_net_plus/src/pix/due_charge/models/due_charge_interest_rates.dart';
import 'package:gerencia_net_plus/src/pix/due_charge/models/due_charge_reduction.dart';
import 'package:gerencia_net_plus/src/pix/models/additional_info.dart';

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
  );
}
