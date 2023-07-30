// Project imports:
import '../config/network/app_network.dart';
import '../pix/pix_operations.dart';
import 'gerencia_net_credentials.dart';

/// Base GerenciaNetPlus class to use for integration.
///
/// Instantiate this class to use all operations available by
/// the GerenciaNet API.
class GerenciaNetPlus {
  final GerenciaNetCredentials _credentials;

  /// Default constructor.
  const GerenciaNetPlus({
    required GerenciaNetCredentials credentials,
  }) : _credentials = credentials;

  AppNetwork get _appNetwork => AppNetwork(sandbox: _credentials.sandbox);

  /// All the Pix operations available by the GerenciaNet API.
  Pix get pix => Pix(
        credentials: _credentials,
        pixEndPoints: _appNetwork.pix,
      );
}
