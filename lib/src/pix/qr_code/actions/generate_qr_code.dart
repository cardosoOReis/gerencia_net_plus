import '../../../config/http_client/gerencia_net_plus_pix_rest_client.dart';
import '../models/qr_code.dart';

class GenerateQrCode {
  final GerenciaNetPlusPixRestClient _client;

  const GenerateQrCode(this._client);

  Future<QrCode> call(int locationId) async {
    final endPoint = _client.pixEndPoints.qrCode.generateQrCode(locationId);

    final result = await _client<Map<String, dynamic>>(endPoint: endPoint);

    return QrCode.fromMap(result.data!);
  }
}
