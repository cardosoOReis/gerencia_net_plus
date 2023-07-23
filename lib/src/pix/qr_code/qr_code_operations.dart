// Project imports:
import '../../config/http_client/gerencia_net_plus_pix_rest_client.dart';
import 'actions/generate_qr_code.dart';
import 'models/qr_code.dart';

class QrCodeOperations {
  final GerenciaNetPlusPixRestClient _client;

  const QrCodeOperations({
    required GerenciaNetPlusPixRestClient client,
  }) : _client = client;

  Future<QrCode> getQrCodeFromLocation(int idLocation) async {
    final generateQrCode = GenerateQrCode(_client);

    return generateQrCode(idLocation);
  }
}
