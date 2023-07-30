// Package imports:
import 'package:equatable/equatable.dart';

/// Organizes the information about the debtor of the charge.
///
/// It does not necessarily identify who will actually make the payment. A CPF
/// (Brazilian individual taxpayer registry identification number) can be the
/// debtor of a charge, but it may happen that another CPF makes the payment
/// of the charge.
sealed class DebtorDetails extends Equatable {
  /// Organizes the information about the debtor of the charge.
  ///
  /// It does not necessarily identify who will actually make the payment. A CPF
  /// (Brazilian individual taxpayer registry identification number) can be the
  /// debtor of a charge, but it may happen that another CPF makes the payment
  /// of the charge.
  const DebtorDetails();

  /// Handy method to convert a [DebtorDetails] to a Map.
  Map<String, dynamic> toMap();
}

/// Represents the details of a physical debtor, with a [cpf].
///
/// This class extends the [DebtorDetails] class to provide specific
/// information about a physical debtor.
class PhysicalDebtorDetails extends DebtorDetails {
  /// The name of the physical debtor.
  final String name;

  /// The CPF (Brazilian individual taxpayer registry) of the physical debtor.
  final String cpf;

  /// The email address of the physical debtor.
  final String? email;

  /// The address of the physical debtor.
  final String? address;

  /// The city where the physical debtor resides.
  final String? city;

  /// The federative unit (state) where the physical debtor resides.
  final String? federativeUnit;

  /// The CEP (postal code) of the physical debtor's address.
  final String? cep;

  /// Represents the details of a physical debtor, with a [cpf].
  ///
  /// This class extends the [DebtorDetails] class to provide specific
  /// information about a physical debtor.
  const PhysicalDebtorDetails({
    required this.name,
    required this.cpf,
    required this.email,
    required this.address,
    required this.city,
    required this.federativeUnit,
    required this.cep,
  });

  @override
  Map<String, dynamic> toMap() => <String, dynamic>{
        'nome': name,
        'cpf': cpf,
        'logradouro': address,
        'cidade': city,
        'uf': federativeUnit,
        'cep': cep,
      };

  /// Handy constructor to convert a Map to A [PhysicalDebtorDetails].
  factory PhysicalDebtorDetails.fromMap(Map<String, dynamic> json) =>
      PhysicalDebtorDetails(
        name: json['nome'],
        cpf: json['cpf'],
        email: json['email'],
        address: json['logradouro'],
        city: json['cidade'],
        federativeUnit: json['uf'],
        cep: json['cep'],
      );

  @override
  List<Object?> get props => [
        name,
        cpf,
        email,
        address,
        city,
        federativeUnit,
        cep,
      ];

  /// Handy method to update a [PhysicalDebtorDetails].
  PhysicalDebtorDetails copyWith({
    String? name,
    String? cpf,
    String? email,
    String? address,
    String? city,
    String? federativeUnit,
    String? cep,
  }) =>
      PhysicalDebtorDetails(
        name: name ?? this.name,
        cpf: cpf ?? this.cpf,
        email: email ?? this.email,
        address: address ?? this.address,
        city: city ?? this.city,
        federativeUnit: federativeUnit ?? this.federativeUnit,
        cep: cep ?? this.cep,
      );
}

/// Represents the details of a legal debtor, with a [cnpj].
///
/// This class extends the [DebtorDetails] class to provide specific
/// information about a legal debtor.
class LegalDebtorDetails extends DebtorDetails {
  /// The name of the legal debtor.
  final String name;

  /// The CNPJ (Brazilian corporate taxpayer registry) of the legal debtor.
  final String cnpj;

  /// The email address of the legal debtor.
  final String? email;

  /// The address of the legal debtor.
  final String? address;

  /// The city where the legal debtor is located.
  final String? city;

  /// The federative unit (state) where the legal debtor is located.
  final String? federativeUnit;

  /// The CEP (postal code) of the legal debtor's address.
  final String? cep;

  /// Represents the details of a legal debtor, with a [cnpj].
  ///
  /// This class extends the [DebtorDetails] class to provide specific
  /// information about a legal debtor.
  const LegalDebtorDetails({
    required this.name,
    required this.cnpj,
    required this.email,
    required this.address,
    required this.city,
    required this.federativeUnit,
    required this.cep,
  });

  @override
  Map<String, dynamic> toMap() => <String, dynamic>{
        'nome': name,
        'cnpj': cnpj,
        'logradouro': address,
        'cidade': city,
        'uf': federativeUnit,
        'cep': cep,
      };

  /// Handy method to convert a Map to a [LegalDebtorDetails].
  factory LegalDebtorDetails.fromMap(Map<String, dynamic> json) =>
      LegalDebtorDetails(
        name: json['nome'],
        cnpj: json['cnpj'],
        email: json['email'],
        address: json['logradouro'],
        city: json['cidade'],
        federativeUnit: json['uf'],
        cep: json['cep'],
      );

  @override
  List<Object?> get props => [
        name,
        cnpj,
        email,
        address,
        city,
        federativeUnit,
        cep,
      ];

  /// Handy method to update a [LegalDebtorDetails].
  LegalDebtorDetails copyWith({
    String? name,
    String? cnpj,
    String? email,
    String? address,
    String? city,
    String? federativeUnit,
    String? cep,
  }) =>
      LegalDebtorDetails(
        name: name ?? this.name,
        cnpj: cnpj ?? this.cnpj,
        email: email ?? this.email,
        address: address ?? this.address,
        city: city ?? this.city,
        federativeUnit: federativeUnit ?? this.federativeUnit,
        cep: cep ?? this.cep,
      );
}
