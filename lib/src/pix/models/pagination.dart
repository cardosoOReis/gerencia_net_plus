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

  /// Helper class to facilitate pagination and parameters.
  const Parameters({
    required this.start,
    required this.end,
    required this.pagination,
  });

  /// Handy method to convert [Parameters] to a [Map].
  Map<String, dynamic> toMap() => <String, dynamic>{
        'inicio': start.toRFC3339(),
        'fim': end.toRFC3339(),
        'paginacao': pagination.toMap(),
      };

  /// Handy method to parse a [Map] to [Parameters].
  factory Parameters.fromMap(Map<String, dynamic> map) => Parameters(
        start: DateTime.parse(map['inicio']),
        end: DateTime.parse(map['fim']),
        pagination:
            Pagination.fromMap(map['paginacao'] as Map<String, dynamic>),
      );
}

/// The current pagination's information.
class Pagination {
  /// Current page in this pagination.
  final int currentPage;

  /// Amount of itens by the current page.
  final int pageSize;

  /// Amount of pages that can be searched with the current [pageSize] amount
  /// of itens.
  final int pageAmount;

  /// Total amount of registers in your account.
  final int totalItemAmount;

  /// The current pagination's information.
  const Pagination({
    required this.currentPage,
    required this.pageSize,
    required this.pageAmount,
    required this.totalItemAmount,
  });

  /// Handy method to convert [Pagination] to a [Map].
  Map<String, dynamic> toMap() => <String, dynamic>{
        'paginaAtual': currentPage,
        'itensPorPagina': pageSize,
        'quantidadeDePaginas': pageAmount,
        'quantidadeTotalDeItens': totalItemAmount,
      };

  /// Handy method to parse a [Map] to [Pagination].
  factory Pagination.fromMap(Map<String, dynamic> map) => Pagination(
        currentPage: map['paginaAtual'] as int,
        pageSize: map['itensPorPagina'] as int,
        pageAmount: map['quantidadeDePaginas'] as int,
        totalItemAmount: map['quantidadeTotalDeItens'] as int,
      );
}
