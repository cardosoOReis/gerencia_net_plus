// Project imports:
import '../../config/http_client/gerencia_net_plus_pix_rest_client.dart';
import '../../gerencia_net_credentials.dart';
import '../models/additional_info.dart';
import '../models/debtor.dart';
import '../models/pix_status.dart';
import 'actions/pix_create_charge.dart';
import 'actions/pix_create_immediate_charge.dart';
import 'actions/pix_detail_charge.dart';
import 'actions/pix_list_charges.dart';
import 'actions/pix_update_charge.dart';
import 'models/pix_immediate_charge.dart';
import 'models/pix_immediate_charge_list.dart';

class ImmediateCharge {
  final GerenciaNetPlusPixRestClient _client;
  final GerenciaNetCredentials _credentials;

  const ImmediateCharge({
    required GerenciaNetPlusPixRestClient client,
    required GerenciaNetCredentials credentials,
  })  : _client = client,
        _credentials = credentials;

  Future<PixImmediateCharge> createCharge({
    required Duration expiration,
    required double value,
    String? txid,
    Debtor? debtor,
    String? payerSolicitation,
    List<AdditionalInfo> additionalInfo = const [],
  }) async {
    final pixCreateCharge = PixCreateCharge(_client);

    return pixCreateCharge(
      credentials: _credentials,
      expiration: expiration,
      txid: txid,
      value: value,
      debtor: debtor,
      payerSolicitation: payerSolicitation,
      additionalInfo: additionalInfo,
    );
  }

  Future<PixImmediateCharge> createImmediateCharge({
    required Duration expiration,
    required double value,
    Debtor? debtor,
    String? payerSolicitation,
    List<AdditionalInfo> additionalInfo = const [],
  }) async {
    final pixCreateImmediateCharge = PixCreateImmediateCharge(_client);

    return pixCreateImmediateCharge(
      credentials: _credentials,
      value: value,
      expiration: expiration,
      debtor: debtor,
      payerSolicitation: payerSolicitation,
      additionalInfo: additionalInfo,
    );
  }

  Future<PixImmediateCharge> updateCharge({
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

    return pixUpdateCharge(
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

  Future<PixImmediateCharge> detailCharge(
    String txid, {
    int? revision,
  }) async {
    final pixDetailCharge = PixDetailCharge(_client);

    return pixDetailCharge(
      txid: txid,
      revision: revision,
    );
  }

  Future<PixImmediateChargeList> listCharges({
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
