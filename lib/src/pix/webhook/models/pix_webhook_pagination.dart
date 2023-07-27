import '../../models/pagination.dart';
import 'pix_webhook.dart';

class PixWebhookPagination {
  final Parameters parameters;
  final List<PixWebhook> webhooks;
  const PixWebhookPagination({
    required this.parameters,
    required this.webhooks,
  });

  Map<String, dynamic> toMap() => <String, dynamic>{
        'parametros ': parameters.toMap(),
        'webhooks': webhooks.map((x) => x.toMap()).toList(),
      };

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
