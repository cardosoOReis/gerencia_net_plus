// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:equatable/equatable.dart';

/// The person responsible for paying the immediate charge.
///
/// The person paying
sealed class Debtor extends Equatable {
  const Debtor();

  Map<String, dynamic> toMap();
}

class PhysicalPersonDebtor extends Debtor {
  final String name;
  final String cpf;
  const PhysicalPersonDebtor({
    required this.name,
    required this.cpf,
  });

  @override
  Map<String, dynamic> toMap() => <String, dynamic>{
        'nome': name,
        'cpf': cpf,
      };

  factory PhysicalPersonDebtor.fromMap(Map<String, dynamic> map) =>
      PhysicalPersonDebtor(
        name: map['nome'] as String,
        cpf: map['cpf'] as String,
      );

  String toJson() => json.encode(toMap());

  factory PhysicalPersonDebtor.fromJson(String source) =>
      PhysicalPersonDebtor.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object?> get props => [name, cpf];

  PhysicalPersonDebtor copyWith({
    String? name,
    String? cpf,
  }) =>
      PhysicalPersonDebtor(
        name: name ?? this.name,
        cpf: cpf ?? this.cpf,
      );
}

class LegalPersonDebtor extends Debtor {
  final String name;
  final String cnpj;
  const LegalPersonDebtor({
    required this.name,
    required this.cnpj,
  });

  @override
  Map<String, dynamic> toMap() => <String, dynamic>{
        'nome': name,
        'cnpj': cnpj,
      };

  factory LegalPersonDebtor.fromMap(Map<String, dynamic> map) =>
      LegalPersonDebtor(
        name: map['nome'] as String,
        cnpj: map['cnpj'] as String,
      );

  String toJson() => json.encode(toMap());

  factory LegalPersonDebtor.fromJson(String source) =>
      LegalPersonDebtor.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object?> get props => [name, cnpj];

  LegalPersonDebtor copyWith({
    String? name,
    String? cnpj,
  }) =>
      LegalPersonDebtor(
        name: name ?? this.name,
        cnpj: cnpj ?? this.cnpj,
      );
}
