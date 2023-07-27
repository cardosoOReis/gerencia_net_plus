// Project imports:
import 'pix_endpoints.dart';

/// Contains all the endpoints used by this application.
class AppNetwork {
  /// Wheter it should use the production or sandbox endpoints.
  final bool sandbox;

  /// Contains all the endpoints used by this application.
  const AppNetwork({
    this.sandbox = true,
  });

  /// Contains all Pix endpoints.
  PixEndPoints get pix => PixEndPoints(sandbox: sandbox);
}
