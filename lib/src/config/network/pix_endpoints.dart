// Project imports:
import 'models/end_point.dart';
import 'models/http_method.dart';
import 'pix/pix_due_charge_end_points.dart';
import 'pix/pix_immediate_charge_end_points.dart';
import 'pix/pix_location_end_points.dart';
import 'pix/pix_transactions_end_points.dart';
import 'pix/pix_webhooks_end_point.dart';

/// Contains all Pix endpoints.
class PixEndPoints {
  /// Wether to use production endpoints or sandbox endpoints.
  final bool sandbox;

  /// Default constructor.
  const PixEndPoints({
    required this.sandbox,
  });

  static const _productionUrl = 'https://api-pix.gerencianet.com.br';
  static const _sandboxUrl = 'https://api-pix-h.gerencianet.com.br';

  /// The default url for the current enviroment.
  String get url => sandbox ? _sandboxUrl : _productionUrl;

  /// Authorization endpoint.
  EndPoint authorize() => EndPoint(
        path: '$url/oauth/token',
        method: HttpMethod.post,
      );

  /// Contains all immediate charge endpoints.
  PixImmediateChargeEndPoints get immediateCharge =>
      PixImmediateChargeEndPoints(url: url);

  /// Contains all due charge endpoints.
  PixDueChargeEndPoints get dueCharge => PixDueChargeEndPoints(url: url);

  /// Contains all transactions endpoints.
  PixTransactionsEndPoints get transactions =>
      PixTransactionsEndPoints(url: url);

  /// Contains all location endpoints.
  PixLocationEndPoints get location => PixLocationEndPoints(url: url);

  /// Contains all webhooks endpoints.
  PixWebHookEndPoints get webhook => PixWebHookEndPoints(url: url);
}
