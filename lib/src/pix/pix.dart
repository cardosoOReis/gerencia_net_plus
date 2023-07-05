import 'package:gerencia_net_plus/src/pix/charge/models/pix_charge_consulting.dart';
import 'package:gerencia_net_plus/src/pix/charge/pix_detail_charge.dart';
import 'package:gerencia_net_plus/src/pix/charge/pix_list_charges.dart';
import 'package:gerencia_net_plus/src/pix/charge/pix_update_charge.dart';
import 'package:gerencia_net_plus/src/pix/models/pix_status.dart';

import '../config/http_client/gerencia_net_plus_pix_rest_client.dart';
import '../gerencia_net_credentials.dart';
import 'charge/models/pix_charge.dart';
import 'charge/pix_create_charge.dart';
import 'charge/pix_create_immediate_charge.dart';
import 'models/additional_info.dart';
import 'models/debtor.dart';

class Pix {
  final GerenciaNetCredentials _credentials;
  final GerenciaNetPlusPixRestClient _client;

  const Pix({
    required GerenciaNetCredentials credentials,
    required GerenciaNetPlusPixRestClient client,
  })  : _client = client,
        _credentials = credentials;

  Future<PixCharge> createCharge({
    required Duration expiration,
    required double value,
    String? txid,
    Debtor? debtor,
    String? payerSolicitation,
    List<AdditionalInfo> additionalInfo = const [],
  }) async {
    final pixCreateCharge = PixCreateCharge(_client);

    return await pixCreateCharge(
      credentials: _credentials,
      expiration: expiration,
      txid: txid,
      value: value,
      debtor: debtor,
      payerSolicitation: payerSolicitation,
      additionalInfo: additionalInfo,
    );
  }

  Future<PixCharge> createImmediateCharge({
    required Duration expiration,
    required double value,
    Debtor? debtor,
    String? payerSolicitation,
    List<AdditionalInfo> additionalInfo = const [],
  }) async {
    final pixCreateImmediateCharge = PixCreateImmediateCharge(_client);

    return await pixCreateImmediateCharge(
      credentials: _credentials,
      value: value,
      expiration: expiration,
      debtor: debtor,
      payerSolicitation: payerSolicitation,
      additionalInfo: additionalInfo,
    );
  }

  Future<PixCharge> updateCharge({
    required String txid,
    bool? persist,
    double? value,
    int? locId,
    Debtor? debtor,
    PixStatus? status,
    String? pixKey,
    List<AdditionalInfo>? additionalInfo,
    String? payerSolicitation,
  }) async {
    final pixUpdateCharge = PixUpdateCharge(_client);

    return await pixUpdateCharge(
      txid: txid,
      value: value,
      locId: locId,
      debtor: debtor,
      status: status,
      pixKey: pixKey,
      additionalInfo: additionalInfo,
      payerSolicitation: payerSolicitation,
    );
  }

  Future<PixCharge> detailCharge(
    String txid, {
    int? revisao,
  }) async {
    final pixDetailCharge = PixDetailCharge(_client);

    return pixDetailCharge(
      txid: txid,
      revision: revisao,
    );
  }

  Future<PixChargeList> listCharges({
    required DateTime start,
    required DateTime end,
    String? cpf,
    String? cnpj,
    PixStatus? status,
    int? pageNumber,
    int? itemAmount,
  }) async {
    final pixListCharges = PixListCharges(_client);

    return pixListCharges(
      start: start,
      end: end,
      cpf: cpf,
      cnpj: cnpj,
      status: status,
      pageNumber: pageNumber,
      itemAmount: itemAmount,
    );
  }
}
