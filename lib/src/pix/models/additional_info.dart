// Package imports:
import 'package:equatable/equatable.dart';

/// Additional Information to associate to a Charge
///
/// [name] is the 'title' of the information, and [value] is what the
/// information actually means.
///
/// Example:
///
/// ```dart
/// const additionalInfo = AdditionalInfo(
///    name: 'Itens purchased by debtor.',
///    value: 'Item 1, Item 2, Item 3.',
///  );
/// ```
///
class AdditionalInfo extends Equatable {
  /// Informs what is being holded in the [value] field.
  final String name;

  /// The value this additional information holds.
  final String value;

  /// Additional Information to associate to a Charge
  ///
  /// [name] is the 'title' of the information, and [value] is what the
  /// information actually means.
  ///
  /// Example:
  ///
  /// ```dart
  /// const additionalInfo = AdditionalInfo(
  ///    name: 'Itens purchased by debtor.',
  ///    value: 'Item 1, Item 2, Item 3.',
  ///  );
  /// ```
  ///
  const AdditionalInfo({
    required this.name,
    required this.value,
  });

  /// Handy method to transform to a Map<String, dynamic>.
  Map<String, dynamic> toMap() => <String, dynamic>{
        'nome': name,
        'valor': value,
      };

  /// Handy method to convert from a Map<String, dynamic>.
  factory AdditionalInfo.fromMap(Map<String, dynamic> map) => AdditionalInfo(
        name: map['nome'] as String,
        value: map['valor'] as String,
      );

  @override
  List<Object> get props => [name, value];

  /// Handy method to facilitate updates to additional informations.
  AdditionalInfo copyWith({
    String? name,
    String? value,
  }) =>
      AdditionalInfo(
        name: name ?? this.name,
        value: value ?? this.value,
      );
}
