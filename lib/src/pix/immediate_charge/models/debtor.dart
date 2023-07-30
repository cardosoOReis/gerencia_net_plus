// Package imports:
import 'package:equatable/equatable.dart';

/// The person responsible for paying the immediate charge.
///
/// It doesn't identifies the person/entity actually pays the charge, only
/// the person that should pay the charge. Another unrelated person could still
/// pay the charge.
///
/// The person paying can be either a [PhysicalPersonDebtor], with a CPF, or a
/// [LegalPersonDebtor], with a CNPJ. All the other fields are equal for both
/// classes.
sealed class Debtor extends Equatable {
  /// The person responsible for paying the immediate charge.
  ///
  /// It doesn't identifies the person/entity actually pays the charge, only
  /// the person that should pay the charge. Another unrelated person could still
  /// pay the charge.
  ///
  /// The person paying can be either a [PhysicalPersonDebtor], with a CPF, or a
  /// [LegalPersonDebtor], with a CNPJ. All the other fields are equal for both
  /// classes.
  const Debtor();

  /// Handy method to convert a [Debtor] to a [Map].
  Map<String, dynamic> toMap();
}

/// The Physical Person responsible for paying the immediate charge.
///
/// It doesn't identifies the person/entity actually pays the charge, only
/// the person that should pay the charge. Another unrelated person could still
/// pay the charge.
class PhysicalPersonDebtor extends Debtor {
  /// The physical person's name.
  final String name;

  /// The physical person's CPF.
  final String cpf;

  /// The Physical Person responsible for paying the immediate charge.
  ///
  /// It doesn't identifies the person/entity actually pays the charge, only
  /// the person that should pay the charge. Another unrelated person could
  /// still pay the charge.
  const PhysicalPersonDebtor({
    required this.name,
    required this.cpf,
  });

  @override
  Map<String, dynamic> toMap() => <String, dynamic>{
        'nome': name,
        'cpf': cpf,
      };

  /// Handy method to get a [PhysicalPersonDebtor] from a [Map].
  factory PhysicalPersonDebtor.fromMap(Map<String, dynamic> map) =>
      PhysicalPersonDebtor(
        name: map['nome'] as String,
        cpf: map['cpf'] as String,
      );

  @override
  List<Object?> get props => [name, cpf];

  /// Handy method to change a [PhysicalPersonDebtor] values.
  PhysicalPersonDebtor copyWith({
    String? name,
    String? cpf,
  }) =>
      PhysicalPersonDebtor(
        name: name ?? this.name,
        cpf: cpf ?? this.cpf,
      );
}

/// The Legal Person responsible for paying the immediate charge.
///
/// It doesn't identifies the person/entity actually pays the charge, only
/// the person that should pay the charge. Another unrelated person could
/// still pay the charge.
class LegalPersonDebtor extends Debtor {
  /// The leagal person's name.
  final String name;

  /// The leagal person's CNPJ.
  final String cnpj;

  /// The Legal Person responsible for paying the immediate charge.
  ///
  /// It doesn't identifies the person/entity actually pays the charge, only
  /// the person that should pay the charge. Another unrelated person could
  /// still pay the charge.
  const LegalPersonDebtor({
    required this.name,
    required this.cnpj,
  });

  @override
  Map<String, dynamic> toMap() => <String, dynamic>{
        'nome': name,
        'cnpj': cnpj,
      };

  /// Handy method to get a [LegalPersonDebtor] from a [Map].
  factory LegalPersonDebtor.fromMap(Map<String, dynamic> map) =>
      LegalPersonDebtor(
        name: map['nome'] as String,
        cnpj: map['cnpj'] as String,
      );

  @override
  List<Object?> get props => [name, cnpj];

  /// Handy method to change a [LegalPersonDebtor] values.
  LegalPersonDebtor copyWith({
    String? name,
    String? cnpj,
  }) =>
      LegalPersonDebtor(
        name: name ?? this.name,
        cnpj: cnpj ?? this.cnpj,
      );
}
