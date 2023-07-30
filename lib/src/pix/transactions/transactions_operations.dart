// Project imports:
import '../../config/http_client/gerencia_net_plus_pix_rest_client.dart';
import '../../config/utils/txid.dart' as txid_utils;
import '../../core/gerencia_net_credentials.dart';
import '../models/devolution.dart';
import '../models/recieved_pix.dart';
import 'actions/detail_devolution.dart';
import 'actions/detail_recieved_pix.dart';
import 'actions/detail_sent_pix.dart';
import 'actions/list_recieved_pix.dart';
import 'actions/list_sent_pix.dart';
import 'actions/request_devolution.dart';
import 'actions/send_pix.dart';
import 'models/detailed_sent_pix.dart';
import 'models/payee_details.dart';
import 'models/recieved_pix_pagination.dart';
import 'models/sent_pix.dart';
import 'models/sent_pix_pagination.dart';
import 'models/sent_pix_status.dart';

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

  Future<SentPix> sendPix({
    required double value,
    required PayeeDetails payeeDetails,
    String? id,
    String? payerInfo,
  }) async {
    final sendPix = SendPix(_client);

    return sendPix(
      id: id ?? txid_utils.generate(),
      value: value,
      payerPixKey: _credentials.pixKey,
      payeeDetails: payeeDetails,
      payerInfo: payerInfo,
    );
  }

  Future<DetailedSentPix> detailSentPix(String endToEndId) async {
    final detailSentPix = DetailSentPix(_client);

    return detailSentPix(endToEndId);
  }

  Future<SentPixPagination> listSentPix({
    required DateTime start,
    required DateTime end,
    SentPixStatus? status,
    bool? hasDevolution,
    int? pageNumber,
    int? pageSize,
  }) async {
    final listSentPix = ListSentPix(_client);

    return listSentPix(
      start: start,
      end: end,
      status: status,
      hasDevolution: hasDevolution,
      pageNumber: pageNumber,
      pageSize: pageSize,
    );
  }

  Future<Devolution> requestDevolution({
    required String endToEndId,
    required double value,
    String? devolutionId,
  }) async {
    final requestDevolution = RequestDevolution(_client);

    return requestDevolution(
      e2eId: endToEndId,
      devolutionId: devolutionId ?? txid_utils.generate(),
      value: value,
    );
  }

  Future<Devolution> detailDevolution({
    required String endToEndId,
    required String devolutionId,
  }) async {
    final detailDevolution = DetailDevolution(_client);

    return detailDevolution(e2eId: endToEndId, devolutionId: devolutionId);
  }
}
