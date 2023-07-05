// Project imports:
import '../../../config/http_client/gerencia_net_plus_pix_rest_client.dart';
import '../../../config/utils/date_extensions.dart';
import '../../../config/utils/map_extensions.dart';
import '../../models/pix_status.dart';
import '../models/pix_charge_consulting.dart';

class PixListCharges {
  final GerenciaNetPlusPixRestClient client;

  const PixListCharges(this.client);

  Future<PixChargeList> call({
    required DateTime start,
    required DateTime end,
    required String? cpf,
    required String? cnpj,
    required PixStatus? status,
    required int? pageNumber,
    required int? itemAmount,
  }) async {
    final queryParameters = <String, dynamic>{
      'inicio': start.toRFC3339(),
      'fim': end.toRFC3339(),
    }
      ..addIfNotNull('cpf', cpf)
      ..addIfNotNull('cnpj', cnpj)
      ..addIfNotNull('status', status?.value)
      ..addIfNotNull('paginacao.paginaAtual', pageNumber)
      ..addIfNotNull('paginacao.itensPorPagina', itemAmount);

    final endPoint = client.pixEndPoints.charge.pixListCharges();

    final result = await client<Map<String, dynamic>>(
      endPoint: endPoint,
      queryParameters: queryParameters,
    );

    return PixChargeList.fromMap(result.data!);
  }
}
