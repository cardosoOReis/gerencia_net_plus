// Project imports:
import 'config/http_client/gerencia_net_plus_pix_rest_client.dart';
import 'config/network/app_network.dart';
import 'gerencia_net_credentials.dart';
import 'pix/pix.dart';

class GerenciaNetPlus {
  final GerenciaNetCredentials credentials;

  const GerenciaNetPlus({
    required this.credentials,
  });

  AppNetwork get appNetwork => AppNetwork(sandbox: credentials.sandbox);

  Pix get pix => Pix(
        credentials: credentials,
        client: GerenciaNetPlusPixRestClient(
          credentials: credentials,
          pixEndPoints: appNetwork.pix,
        ),
      );
}
