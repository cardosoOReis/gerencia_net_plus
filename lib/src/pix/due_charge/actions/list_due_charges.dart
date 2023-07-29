// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import '../../../config/http_client/gerencia_net_plus_pix_rest_client.dart';
import '../../../config/utils/date_extensions.dart';
import '../../../config/utils/map_extensions.dart';
import '../../../core/gerencia_net_exception.dart';
import '../../models/charge_status.dart';
import '../models/due_charge_pagination.dart';

class ListDueCharges {
  final GerenciaNetPlusPixRestClient _client;

  const ListDueCharges(this._client);

  Future<DueChargePagination> call({
    required DateTime start,
    required DateTime end,
    required String? cpf,
    required String? cnpj,
    required bool? hasLocation,
    required ChargeStatus? status,
    required int? idDueChargeBatch,
    required int? pageNumber,
    required int? itemAmount,
  }) async {
    final params = <String, dynamic>{
      'inicio': start.toRFC3339(),
      'fim': end.toRFC3339(),
    }
      ..addIfNotNull('cpf', cpf)
      ..addIfNotNull('cnpj', cnpj)
      ..addIfNotNull('locationPresente', hasLocation)
      ..addIfNotNull('status', status?.value)
      ..addIfNotNull('loteCobVID', idDueChargeBatch)
      ..addIfNotNull('paginacao.paginaAtual', pageNumber)
      ..addIfNotNull('paginacao.itensPorPagina', itemAmount);

    final endPoint = _client.pixEndPoints.dueCharge.listDueCharges();

    try {
      final response = await _client<Map<String, dynamic>>(
        endPoint: endPoint,
        queryParameters: params,
      );

      return DueChargePagination.fromMap(response.data!);
    } on DioException catch (e, s) {
      throw GerenciaNetException(
        title: e.response?.data['title'],
        message: e.response?.data['detail'],
        statusCode: e.response?.data['status'] ?? e.response?.statusCode,
        originalException: e,
        stackTrace: s,
      );
    }
  }
}
