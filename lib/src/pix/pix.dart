// Project imports:
import '../config/http_client/gerencia_net_plus_pix_rest_client.dart';
import '../config/network/app_network.dart';
import '../gerencia_net_credentials.dart';
import 'due_charge/due_charge_operations.dart';
import 'immediate_charge/immediate_charge.dart';

/// Contains all available Pix operations.
///
/// Use this property to crate charges, consult your recieved Pix transactions,
/// return any Pix transactions recieved, send a Pix transaction, etc.
class Pix {
  final GerenciaNetCredentials _credentials;
  final PixEndPoints _pixEndPoints;

  /// Default [Pix.new] constructor
  const Pix({
    required GerenciaNetCredentials credentials,
    required PixEndPoints pixEndPoints,
  })  : _pixEndPoints = pixEndPoints,
        _credentials = credentials;

  GerenciaNetPlusPixRestClient get _client => GerenciaNetPlusPixRestClient(
        credentials: _credentials,
        pixEndPoints: _pixEndPoints,
      );

  /// All the Immediate Charge operations available by the GerenciaNet Api.
  ///
  /// Use this to create a Pix charge that doesn't have any fees for delaying
  /// the payment. If you wish to add fees, use [dueCharge].
  ImmediateCharge get immediateCharge => ImmediateCharge(
        client: _client,
        credentials: _credentials,
      );

  /// All the Due Charge operations available by the GerenciaNet Api.
  ///
  /// Use this to create a Pix charge that has fees for delaying
  /// the payment. If you do not wish to add any fees, use [immediateCharge].
  DueChargeOperations get dueCharge => DueChargeOperations(
        client: _client,
        credentials: _credentials,
      );
}
