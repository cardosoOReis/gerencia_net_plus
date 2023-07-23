// Project imports:
import '../models/end_point.dart';
import '../models/http_method.dart';

class PixQrCodeEndpoints {
  final String url;

  const PixQrCodeEndpoints({
    required this.url,
  });

  EndPoint generateQrCode(int locationId) => EndPoint(
        path: '$url/v2/loc/$locationId/qrcode',
        method: HttpMethod.get,
      );
}
