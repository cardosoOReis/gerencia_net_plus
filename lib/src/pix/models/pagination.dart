// Dart imports:
import 'dart:convert';

class Parameters {
  final DateTime start;
  final DateTime end;
  final Pagination pagination;

  const Parameters({
    required this.start,
    required this.end,
    required this.pagination,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'inicio': start.millisecondsSinceEpoch,
      'fim': end.millisecondsSinceEpoch,
      'paginacao': pagination.toMap(),
    };
  }

  factory Parameters.fromMap(Map<String, dynamic> map) {
    return Parameters(
      start: DateTime.parse(map['inicio']),
      end: DateTime.parse(map['fim']),
      pagination: Pagination.fromMap(map['paginacao'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Parameters.fromJson(String source) =>
      Parameters.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Pagination {
  final int currentPage;
  final int itensByPage;
  final int pageAmount;
  final int totalItemAmount;

  const Pagination({
    required this.currentPage,
    required this.itensByPage,
    required this.pageAmount,
    required this.totalItemAmount,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'paginaAtual': currentPage,
      'itensPorPagina': itensByPage,
      'quantidadeDePaginas': pageAmount,
      'quantidadeTotalDeItens': totalItemAmount,
    };
  }

  factory Pagination.fromMap(Map<String, dynamic> map) {
    return Pagination(
      currentPage: map['paginaAtual'] as int,
      itensByPage: map['itensPorPagina'] as int,
      pageAmount: map['quantidadeDePaginas'] as int,
      totalItemAmount: map['quantidadeTotalDeItens'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Pagination.fromJson(String source) =>
      Pagination.fromMap(json.decode(source) as Map<String, dynamic>);
}
