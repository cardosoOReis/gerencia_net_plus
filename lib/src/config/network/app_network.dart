// Project imports:
import 'models/end_point.dart';
import 'models/http_method.dart';

/// Contains all the endpoints used by this application
class AppNetwork {
  const AppNetwork({
    this.sandbox = true,
  });

  final bool sandbox;
  PixEndPoints get pix => PixEndPoints(sandbox: sandbox);
}

class PixEndPoints {
  final bool sandbox;

  const PixEndPoints({
    required this.sandbox,
  });

  static const _productionUrl = 'https://api-pix.gerencianet.com.br';
  static const _sandboxUrl = 'https://api-pix-h.gerencianet.com.br';

  String get url => sandbox ? _sandboxUrl : _productionUrl;

  EndPoint authorize() => EndPoint(
        path: '$url/oauth/token',
        method: HttpMethod.post,
      );
  PixImmediateChargeEndPoints get immediateCharge =>
      PixImmediateChargeEndPoints(url: url);
  PixDueChargeEndPoints get dueCharge => PixDueChargeEndPoints(url: url);
  PixWebHookEndPoints get webhook => PixWebHookEndPoints(url: url);
}

class PixImmediateChargeEndPoints {
  final String url;

  const PixImmediateChargeEndPoints({
    required this.url,
  });

  static const _baseEndPoint = '/v2/cob';

  EndPoint pixCreateCharge(String txid) => EndPoint(
        path: '$url$_baseEndPoint/$txid',
        method: HttpMethod.put,
      );

  EndPoint pixCreateImmediateCharge() => EndPoint(
        path: '$url$_baseEndPoint',
        method: HttpMethod.post,
      );

  EndPoint pixDetailCharge(String txid) => EndPoint(
        path: '$url$_baseEndPoint/$txid',
        method: HttpMethod.get,
      );

  EndPoint pixUpdateCharge(String txid) => EndPoint(
        path: '$url$_baseEndPoint/$txid',
        method: HttpMethod.patch,
      );
  EndPoint pixListCharges() => EndPoint(
        path: '$url$_baseEndPoint',
        method: HttpMethod.get,
      );
}

class PixDueChargeEndPoints {
  final String url;

  const PixDueChargeEndPoints({required this.url});

  static const _baseEndPoint = '/v2/cobv';

  EndPoint createDueCharge(String txid) => EndPoint(
        path: '$url$_baseEndPoint/$txid',
        method: HttpMethod.put,
      );

  EndPoint updateDueCharge(String txid) => EndPoint(
        path: '$url$_baseEndPoint/$txid',
        method: HttpMethod.patch,
      );

  EndPoint detailDueCharge(String txid) => EndPoint(
        path: '$url$_baseEndPoint/$txid',
        method: HttpMethod.get,
      );

  EndPoint listDueCharges() => EndPoint(
        path: '$url$_baseEndPoint',
        method: HttpMethod.get,
      );
}

class PixWebHookEndPoints {
  final String url;

  const PixWebHookEndPoints({
    required this.url,
  });

  static const _baseEndPoint = '/v2/webhook';

  EndPoint pixConfigWebhook(String key) => EndPoint(
        path: '$url$_baseEndPoint/$key',
        method: HttpMethod.put,
      );

  EndPoint pixDetailWebhook(String key) => EndPoint(
        path: '$url$_baseEndPoint/$key',
        method: HttpMethod.get,
      );

  EndPoint pixListWebhook() => EndPoint(
        path: '$url$_baseEndPoint',
        method: HttpMethod.get,
      );

  EndPoint pixDeleteWebhook(String key) => EndPoint(
        path: '$url$_baseEndPoint/$key',
        method: HttpMethod.delete,
      );
}
