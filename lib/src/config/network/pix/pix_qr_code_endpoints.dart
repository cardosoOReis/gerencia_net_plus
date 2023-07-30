// Project imports:
import '../models/end_point.dart';
import '../models/http_method.dart';

/// Endpoints of [QRCodeOperations].
class PixQrCodeEndpoints {
  /// The base url of this endpoint.
  final String url;

  /// Endpoints of [QRCodeOperations].
  const PixQrCodeEndpoints({
    required this.url,
  });

  /// Endpoint to generate a [QRCode].
  EndPoint generateQrCode(int locationId) => EndPoint(
        path: '$url/v2/loc/$locationId/qrcode',
        method: HttpMethod.get,
      );
}
