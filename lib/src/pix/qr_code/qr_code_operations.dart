// Project imports:
import '../../config/http_client/gerencia_net_plus_pix_rest_client.dart';
import '../immediate_charge/immediate_charge_operations.dart';
import '../immediate_charge/models/debtor.dart';
import '../models/additional_info.dart';
import 'actions/generate_qr_code.dart';
import 'models/qr_code.dart';

class QrCodeOperations {
  final GerenciaNetPlusPixRestClient _client;
  final ImmediateChargeOperations _immediateChargeOperations;

  const QrCodeOperations({
    required GerenciaNetPlusPixRestClient client,
    required ImmediateChargeOperations immediateChargeOperations,
  })  : _immediateChargeOperations = immediateChargeOperations,
        _client = client;

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

  Future<QrCode> getQrCodeFromLocation(int idLocation) async {
    final generateQrCode = GenerateQrCode(_client);

    return generateQrCode(idLocation);
  }
}
