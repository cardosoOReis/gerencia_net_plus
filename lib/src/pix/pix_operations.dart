// Project imports:
import '../config/http_client/gerencia_net_plus_pix_rest_client.dart';
import '../config/network/pix_endpoints.dart';
import '../gerencia_net_credentials.dart';
import 'due_charge/due_charge_operations.dart';
import 'immediate_charge/immediate_charge_operations.dart';
import 'locations/location_operations.dart';
import 'qr_code/qr_code_operations.dart';
import 'transactions/transactions_operations.dart';
import 'webhook/webhook_operations.dart';

/// Contains all available Pix operations.
///
/// Use this property to crate charges, consult your recieved Pix transactions,
/// return any Pix transactions recieved, send a Pix transaction, etc.
class Pix {
  final GerenciaNetCredentials _credentials;
  final PixEndPoints _pixEndPoints;

  /// Contains all available Pix operations.
  ///
  /// Use this property to crate charges, consult your recieved Pix
  /// transactions, return any Pix transactions recieved, send a Pix
  /// transaction, etc.
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
  ImmediateChargeOperations get immediateCharge => ImmediateChargeOperations(
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

  /// All Pix Transactions operations available by the GerenciaNet Api.
  ///
  /// Use this to:
  ///   - Detail a recieved Pix;
  ///   - List all recieved Pix;
  ///   - Send a Pix transaction to a Pix key;
  ///   - Detail a sent Pix transaction;
  ///   - List all sent Pix transactions;
  ///   - Request a devolution;
  ///   - Detail a devolution.
  TransactionsOperations get transactions => TransactionsOperations(
        client: _client,
        credentials: _credentials,
      );

  LocationOperations get location => LocationOperations(client: _client);

  /// All the QR Code operations, with some helper methods to make integration
  /// with the QR Code functionality easier.
  QrCodeOperations get qrCode => QrCodeOperations(
        client: _client,
        immediateChargeOperations: immediateCharge,
      );

  WebhookOperations get webhook => WebhookOperations(
        client: _client,
        credentials: _credentials,
      );
}
