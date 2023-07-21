// Project imports:
import '../../gerencia_net_credentials.dart';
import '../network/pix_endpoints.dart';
import 'gerencia_net_plus_rest_client.dart';
import 'interceptors/gerencia_net_plus_pix_auth_interceptor.dart';

/// Dio client responsible to handle Pix operations.
class GerenciaNetPlusPixRestClient extends GerenciaNetPlusRestClient {
  /// Pix endpoints to be used by the client.
  ///
  /// See more at: [Pix API Documentation](https://dev.gerencianet.com.br/docs/api-pix-endpoints)
  final PixEndPoints pixEndPoints;

  /// Default Constructor.
  ///
  /// An Interceptor is being added to handle Authorization.
  GerenciaNetPlusPixRestClient({
    required GerenciaNetCredentials credentials,
    required this.pixEndPoints,
    required super.certificateLoader,
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
