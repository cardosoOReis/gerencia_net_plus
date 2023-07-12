// Project imports:
import 'pix_endpoints.dart';

/// Contains all the endpoints used by this application
class AppNetwork {
  /// Default constructor.
  const AppNetwork({
    this.sandbox = true,
  });

  /// Wheter it should use the production or sandbox endpoints.
  final bool sandbox;

  /// Contains all Pix endpoints.
  PixEndPoints get pix => PixEndPoints(sandbox: sandbox);
}
