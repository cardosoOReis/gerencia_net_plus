import '../../config/http_client/gerencia_net_plus_pix_rest_client.dart';
import '../models/pix_recieved.dart';
import 'actions/detail_recieved_pix.dart';

/// Groups all available transactions operations.
class TransactionsOperations {
  final GerenciaNetPlusPixRestClient _client;
  //TODO: Uncomment [_credentials] if is needed.

  // final GerenciaNetCredentials _credentials;

  const TransactionsOperations({
    required GerenciaNetPlusPixRestClient client,
    // required GerenciaNetCredentials credentials,
  }) : // _credentials = credentials,
        _client = client;

  Future<PixRecieved> detailRecievedPix(String endToEndId) async {
    final detailRecievedPix = DetailRecievedPix(_client);

    return detailRecievedPix(endToEndId);
  }
}
