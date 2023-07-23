// Project imports:
import '../../config/http_client/gerencia_net_plus_pix_rest_client.dart';
import '../immediate_charge/immediate_charge_operations.dart';
import '../immediate_charge/models/debtor.dart';
import '../models/additional_info.dart';
import 'actions/generate_qr_code.dart';
import 'models/qr_code.dart';

/// Groups all available QR Code operations, with some helper methods to make
/// integration easier.
class QrCodeOperations {
  final GerenciaNetPlusPixRestClient _client;
  final ImmediateChargeOperations _immediateChargeOperations;

  /// Groups all available QR Code operations, with some helper methods to make
  /// integration easier.
  const QrCodeOperations({
    required GerenciaNetPlusPixRestClient client,
    required ImmediateChargeOperations immediateChargeOperations,
  })  : _immediateChargeOperations = immediateChargeOperations,
        _client = client;

  /// Generates a QR Code associated with the given [locationId]
  ///
  /// The [locationId] can be from a [ChargeType.immediateCharge] or a
  /// [ChargeType.dueCharge], and will return an equivalent QR Code with the
  /// charge associated with the [locationId].
  ///
  /// Throws if the [locationId] doesn't have a charge binded to it.
  Future<QrCode> getQrCodeFromLocation(int idLocation) async {
    final generateQrCode = GenerateQrCode(_client);

    return generateQrCode(idLocation);
  }

  /// Creates an Immediate Charge and generates a corresponding QR Code.
  ///
  /// This method allows you to create an Immediate Charge using the provided
  /// parameters, such as [value], [expiration], [txid], [debtor],
  /// [payerSolicitation], and [additionalInfo]. Upon successful creation of the
  /// Immediate Charge, the method automatically generates the associated QR
  /// Code using the generated charge's [locationId].
  Future<QrCode> createImmediateChargeWithQrCode({
    required double value,
    Duration? expiration,
    String? txid,
    Debtor? debtor,
    String? payerSolicitation,
    List<AdditionalInfo> additionalInfo = const [],
  }) async {
    final newCharge = await _immediateChargeOperations.createCharge(
      value: value,
      additionalInfo: additionalInfo,
      debtor: debtor,
      expiration: expiration,
      payerSolicitation: payerSolicitation,
      txid: txid,
    );

    return getQrCodeFromLocation(newCharge.locationInfo.id);
  }
}
