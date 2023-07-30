// Project imports:
import '../../models/pagination.dart';
import 'pix_webhook.dart';

/// Represents a pagination result containing a list of Pix webhooks.
class PixWebhookPagination {
  /// The parameters used for pagination.
  final Parameters parameters;

  /// The list of Pix webhooks in this pagination result.
  final List<PixWebhook> webhooks;

  /// Represents a pagination result containing a list of Pix webhooks.
  const PixWebhookPagination({
    required this.parameters,
    required this.webhooks,
  });

  /// Handy method to convert a [PixWebhookPagination] to a Map.
  Map<String, dynamic> toMap() => <String, dynamic>{
        'parametros ': parameters.toMap(),
        'webhooks': webhooks.map((x) => x.toMap()).toList(),
      };

  /// Handy method to convert a Map to [PixWebhookPagination].
  factory PixWebhookPagination.fromMap(Map<String, dynamic> map) =>
      PixWebhookPagination(
        parameters:
            Parameters.fromMap(map['parametros'] as Map<String, dynamic>),
        webhooks: List<PixWebhook>.from(
          (map['webhooks'] as List<dynamic>).map(
            (e) => PixWebhook.fromMap(e as Map<String, dynamic>),
          ),
        ),
      );
}
