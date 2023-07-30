abstract class PayeeDetails {
  const PayeeDetails();

  Map<String, dynamic> toMap();
}

class PixKeyPayeeDetails extends PayeeDetails {
  final String pixKey;
  const PixKeyPayeeDetails({
    required this.pixKey,
  });

  @override
  Map<String, dynamic> toMap() => <String, dynamic>{
        'chave': pixKey,
      };
}

class BankAccountPayeeDetails extends PayeeDetails {
  final String name;
  final String cpf;
  final String? bankCode;
  final int bankAgency;
  final int bankAccount;
  final BankAccountType bankAccountType;

  const BankAccountPayeeDetails({
    required this.name,
    required this.cpf,
    required this.bankCode,
    required this.bankAgency,
    required this.bankAccount,
    required this.bankAccountType,
  });

  @override
  Map<String, dynamic> toMap() => <String, dynamic>{
        'contaBanco': <String, dynamic>{
          'nome': name,
          'cpf': cpf,
          'codigoBanco': bankCode,
          'agencia': '$bankAgency',
          'conta': '$bankAccount',
          'tipoConta': bankAccountType.value,
        },
      };

  factory BankAccountPayeeDetails.fromMap(Map<String, dynamic> map) =>
      BankAccountPayeeDetails(
        name: map['nome'],
        cpf: map['cpf'],
        bankCode: map['codigoBanco'],
        bankAgency: int.parse(map['agencia']),
        bankAccount: int.parse(map['conta']),
        bankAccountType: BankAccountType.match(map['tipoConta']),
      );
}

/// Enum representing the types of bank accounts.
enum BankAccountType {
  /// Represents a checking account.
  checkingAcount('cacc'),

  /// Represents a savings account.
  savingsAccount('svgs');

  /// Helper to convert from the map.
  final String value;

  const BankAccountType(this.value);

  factory BankAccountType.match(String type) =>
      BankAccountType.values.firstWhere(
        (e) => e.value == type,
        orElse: () => switch (type) {
          'corrente' => BankAccountType.checkingAcount,
          'poupanca' => BankAccountType.savingsAccount,
          _ => throw ArgumentError.value(type),
        },
      );
}
