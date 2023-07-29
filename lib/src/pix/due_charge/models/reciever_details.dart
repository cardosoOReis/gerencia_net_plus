// Dart imports:

class RecieverDetails {
  final String name;
  final String identifier;
  final String adress;
  final String city;
  final String federativeUnit;
  final String cep;

  const RecieverDetails({
    required this.name,
    required this.identifier,
    required this.adress,
    required this.city,
    required this.federativeUnit,
    required this.cep,
  });

  Map<String, dynamic> toMap() => <String, dynamic>{
        'nome': name,
        'identificador': identifier,
        'logradouro': adress,
        'cidade': city,
        'uf': federativeUnit,
        'cep': cep,
      };

  factory RecieverDetails.fromMap(Map<String, dynamic> map) => RecieverDetails(
        name: map['nome'] as String,
        identifier: map['cpf'] as String? ?? map['cnpj'] as String,
        adress: map['logradouro'] as String,
        city: map['cidade'] as String,
        federativeUnit: map['uf'] as String,
        cep: map['cep'] as String,
      );
}
