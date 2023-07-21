// Project imports:
import 'config/http_client/certificate_loader/certificate_loader.dart';
import 'config/http_client/certificate_loader/dart_certificate_loader.dart';
import 'config/network/app_network.dart';
import 'gerencia_net_credentials.dart';
import 'pix/pix_operations.dart';

/// Base GerenciaNetPlus class to use for integration.
///
/// Instantiate this class to use all operations available by
/// the GerenciaNet API.
class GerenciaNetPlus {
  final GerenciaNetCredentials _credentials;

  /// Default constructor.
  GerenciaNetPlus({
    required GerenciaNetCredentials credentials,
  }) : _credentials = credentials;

  AppNetwork get _appNetwork => AppNetwork(sandbox: _credentials.sandbox);

  static CertificateLoader certificateLoader = DartCertificateLoader();

  /// All the Pix operations available by the GerenciaNet API.
  Pix get pix => Pix(
        credentials: _credentials,
        pixEndPoints: _appNetwork.pix,
        certificateLoader: certificateLoader,
      );
}
