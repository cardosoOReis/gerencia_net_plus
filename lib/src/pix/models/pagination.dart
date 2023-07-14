// Dart imports:
import 'dart:convert';

// Project imports:
import '../../config/utils/date_extensions.dart';

/// Helper class to facilitate pagination and parameters.
class Parameters {
  /// Initial date to filter the registers.
  final DateTime start;

  /// End date to filter the registers.
  final DateTime end;

  /// Information abou the current pagination.
  final Pagination pagination;

  const Parameters({
    required this.start,
    required this.end,
    required this.pagination,
  });

  Map<String, dynamic> toMap() => <String, dynamic>{
        'inicio': start.toRFC3339(),
        'fim': end.toRFC3339(),
        'paginacao': pagination.toMap(),
      };

  factory Parameters.fromMap(Map<String, dynamic> map) => Parameters(
        start: DateTime.parse(map['inicio']),
        end: DateTime.parse(map['fim']),
        pagination:
            Pagination.fromMap(map['paginacao'] as Map<String, dynamic>),
      );

  String toJson() => json.encode(toMap());

  factory Parameters.fromJson(String source) =>
      Parameters.fromMap(json.decode(source) as Map<String, dynamic>);
}

/// The current pagination's information.
class Pagination {
  /// Current page in this pagination.
  final int currentPage;

  /// Amount of itens by the current page.
  final int itensByPage;

  /// Amount of pages that can be searched with the current [itensByPage] amount
  /// of itens.
  final int pageAmount;

  /// Total amount of registers in your account.
  final int totalItemAmount;

  const Pagination({
    required this.currentPage,
    required this.itensByPage,
    required this.pageAmount,
    required this.totalItemAmount,
  });

  Map<String, dynamic> toMap() => <String, dynamic>{
        'paginaAtual': currentPage,
        'itensPorPagina': itensByPage,
        'quantidadeDePaginas': pageAmount,
        'quantidadeTotalDeItens': totalItemAmount,
      };

  factory Pagination.fromMap(Map<String, dynamic> map) => Pagination(
        currentPage: map['paginaAtual'] as int,
        itensByPage: map['itensPorPagina'] as int,
        pageAmount: map['quantidadeDePaginas'] as int,
        totalItemAmount: map['quantidadeTotalDeItens'] as int,
      );

  String toJson() => json.encode(toMap());

  factory Pagination.fromJson(String source) =>
      Pagination.fromMap(json.decode(source) as Map<String, dynamic>);
}
