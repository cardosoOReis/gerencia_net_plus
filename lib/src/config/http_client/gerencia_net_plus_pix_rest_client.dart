import '../../gerencia_net_credentials.dart';
import '../network/app_network.dart';
import 'gerencia_net_plus_rest_client.dart';
import 'interceptors/gerencia_net_plus_pix_auth_interceptor.dart';

class GerenciaNetPlusPixRestClient extends GerenciaNetPlusRestClient {
  final PixEndPoints pixEndPoints;

  GerenciaNetPlusPixRestClient({
    required GerenciaNetCredentials credentials,
    required this.pixEndPoints,
  }) : super(
          certificatePath: credentials.certificatePath,
          keyPath: credentials.privateKeyPath,
        ) {
    interceptors.add(
      GerenciaNetPlusPixAuthInterceptor(
        credentials: credentials,
        pixEndPoints: pixEndPoints,
      ),
    );
  }
}
