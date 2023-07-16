// Project imports:
import '../../../config/utils/map_extensions.dart';

abstract class PayeeDetails {
  const PayeeDetails();

  Map<String, dynamic> toMap();
}

class PixKeyPayeeDetails extends PayeeDetails {
  final String pixKey;
  final String? cpf;
  const PixKeyPayeeDetails({
    required this.pixKey,
    this.cpf,
  });

  @override
  Map<String, dynamic> toMap() => <String, dynamic>{
        'chave': pixKey,
      }..addIfNotNull('cpf', cpf);
}

class BankAccountPayeeDetails extends PayeeDetails {
  final String name;
  final String cpf;
  final String bankCode;
  final int banAgency;
  final int bankAccount;
  final BankAccountType bankAccountType;

  const BankAccountPayeeDetails({
    required this.name,
    required this.cpf,
    required this.bankCode,
    required this.banAgency,
    required this.bankAccount,
    required this.bankAccountType,
  });

  @override
  Map<String, dynamic> toMap() => <String, dynamic>{
        'contaBanco': <String, dynamic>{
          'nome': name,
          'cpf': cpf,
          'codigoBanco': bankAccount,
          'agencia': '$banAgency',
          'conta': '$bankAccount',
          'tipoConta': bankAccountType.value,
        },
      };
}

enum BankAccountType {
  checkingAcount('cacc'),
  savingsAccount('svgs');

  final String value;

  const BankAccountType(this.value);
}
