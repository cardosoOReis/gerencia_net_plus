// Project imports:
import '../../config/http_client/gerencia_net_plus_pix_rest_client.dart';
import '../../config/utils/txid.dart';
import '../../gerencia_net_credentials.dart';
import '../models/recieved_pix.dart';
import 'actions/detail_recieved_pix.dart';
import 'actions/list_recieved_pix.dart';
import 'actions/models/recieved_pix_pagination.dart';
import 'actions/send_pix.dart';
import 'models/payee_details.dart';

/// Groups all available transactions operations.
class TransactionsOperations {
  final GerenciaNetPlusPixRestClient _client;
  final GerenciaNetCredentials _credentials;

  const TransactionsOperations({
    required GerenciaNetPlusPixRestClient client,
    required GerenciaNetCredentials credentials,
  })  : _credentials = credentials,
        _client = client;

  Future<RecievedPix> detailRecievedPix(String endToEndId) async {
    final detailRecievedPix = DetailRecievedPix(_client);

    return detailRecievedPix(endToEndId);
  }

  Future<RecievedPixPagination> listRecievedPix({
    required DateTime start,
    required DateTime end,
    String? txid,
    bool? hasTxid,
    bool? hasDevolution,
    String? cpf,
    String? cnpj,
    int? currentPage,
    int? pageSize,
  }) {
    final listRecievedPix = ListRecievedPix(_client);

    return listRecievedPix(
      start: start,
      end: end,
      txid: txid,
      hasTxid: hasTxid,
      hasDevolution: hasDevolution,
      cpf: cpf,
      cnpj: cnpj,
      currentPage: currentPage,
      pageSize: pageSize,
    );
  }

  Future<void> sendPix({
    required double value,
    required PayeeDetails payeeDetails,
    String? id,
    String? payerInfo,
  }) async {
    final sendPix = SendPix(_client);

    await sendPix(
      id: id ?? Txid.generate(),
      value: value,
      payerPixKey: _credentials.pixKey,
      payeeDetails: payeeDetails,
      payerInfo: payerInfo,
    );
  }
}
