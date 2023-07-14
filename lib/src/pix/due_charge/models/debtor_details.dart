// Package imports:
import 'package:equatable/equatable.dart';

sealed class DebtorDetails extends Equatable {
  const DebtorDetails();

  Map<String, dynamic> toMap();
}

class PhysicalDebtorDetails extends DebtorDetails {
  final String name;
  final String cpf;
  final String? email;
  final String? adress;
  final String? city;
  final String? federativeUnit;
  final String? cep;

  const PhysicalDebtorDetails({
    required this.name,
    required this.cpf,
    required this.email,
    required this.adress,
    required this.city,
    required this.federativeUnit,
    required this.cep,
  });

  @override
  Map<String, dynamic> toMap() => <String, dynamic>{
        'nome': name,
        'cpf': cpf,
        'logradouro': adress,
        'cidade': city,
        'uf': federativeUnit,
        'cep': cep,
      };

  factory PhysicalDebtorDetails.fromMap(Map<String, dynamic> json) =>
      PhysicalDebtorDetails(
        name: json['nome'],
        cpf: json['cpf'],
        email: json['email'],
        adress: json['logradouro'],
        city: json['cidade'],
        federativeUnit: json['uf'],
        cep: json['cep'],
      );

  @override
  List<Object?> get props => [
        name,
        cpf,
        email,
        adress,
        city,
        federativeUnit,
        cep,
      ];

  PhysicalDebtorDetails copyWith({
    String? name,
    String? cpf,
    String? email,
    String? adress,
    String? city,
    String? federativeUnit,
    String? cep,
  }) =>
      PhysicalDebtorDetails(
        name: name ?? this.name,
        cpf: cpf ?? this.cpf,
        email: email ?? this.email,
        adress: adress ?? this.adress,
        city: city ?? this.city,
        federativeUnit: federativeUnit ?? this.federativeUnit,
        cep: cep ?? this.cep,
      );
}

class LegalDebtorDetails extends DebtorDetails {
  final String name;
  final String cnpj;
  final String? email;
  final String? adress;
  final String? city;
  final String? federativeUnit;
  final String? cep;

  const LegalDebtorDetails({
    required this.name,
    required this.cnpj,
    required this.email,
    required this.adress,
    required this.city,
    required this.federativeUnit,
    required this.cep,
  });

  @override
  Map<String, dynamic> toMap() => <String, dynamic>{
        'nome': name,
        'cnpj': cnpj,
        'logradouro': adress,
        'cidade': city,
        'uf': federativeUnit,
        'cep': cep,
      };

  factory LegalDebtorDetails.fromMap(Map<String, dynamic> json) =>
      LegalDebtorDetails(
        name: json['nome'],
        cnpj: json['cnpj'],
        email: json['email'],
        adress: json['logradouro'],
        city: json['cidade'],
        federativeUnit: json['uf'],
        cep: json['cep'],
      );

  @override
  List<Object?> get props => [
        name,
        cnpj,
        email,
        adress,
        city,
        federativeUnit,
        cep,
      ];

  LegalDebtorDetails copyWith({
    String? name,
    String? cnpj,
    String? email,
    String? adress,
    String? city,
    String? federativeUnit,
    String? cep,
  }) =>
      LegalDebtorDetails(
        name: name ?? this.name,
        cnpj: cnpj ?? this.cnpj,
        email: email ?? this.email,
        adress: adress ?? this.adress,
        city: city ?? this.city,
        federativeUnit: federativeUnit ?? this.federativeUnit,
        cep: cep ?? this.cep,
      );
}
