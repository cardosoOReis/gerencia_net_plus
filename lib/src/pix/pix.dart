// Project imports:
import '../config/http_client/gerencia_net_plus_pix_rest_client.dart';
import '../config/network/app_network.dart';
import '../gerencia_net_credentials.dart';
import 'immediate_charge/immediate_charge.dart';

class Pix {
  final GerenciaNetCredentials _credentials;
  final PixEndPoints _pixEndPoints;

  const Pix({
    required GerenciaNetCredentials credentials,
    required PixEndPoints pixEndPoints,
  })  : _pixEndPoints = pixEndPoints,
        _credentials = credentials;

  GerenciaNetPlusPixRestClient get _client => GerenciaNetPlusPixRestClient(
        credentials: _credentials,
        pixEndPoints: _pixEndPoints,
      );

  ImmediateCharge get immediateCharge => ImmediateCharge(
        client: _client,
        credentials: _credentials,
      );
}
