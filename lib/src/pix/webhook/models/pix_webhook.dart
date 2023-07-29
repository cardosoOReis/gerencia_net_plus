// Project imports:
import '../../../config/utils/date_extensions.dart';

/// Represents a Pix webhook, which is used to receive notifications for Pix
/// transactions.
class PixWebhook {
  /// The URL to which the webhook notifications will be sent.
  final Uri webhookUrl;

  /// The Pix key associated with this webhook.
  final String pixKey;

  /// The date and time when the webhook was created.
  final DateTime creation;

  /// Represents a Pix webhook, which is used to receive notifications for Pix
  /// transactions.
  const PixWebhook({
    required this.webhookUrl,
    required this.pixKey,
    required this.creation,
  });

  /// Handy method to convert a Map to a [PixWebhook].
  factory PixWebhook.fromMap(Map<String, dynamic> map) => PixWebhook(
        webhookUrl: Uri.parse(map['webhookUrl']),
        pixKey: map['chave'],
        creation: DateTime.parse(map['criacao']),
      );

  /// Handy method to convert a [PixWebhook] to a Map.
  Map<String, dynamic>? toMap() => {
        'webhookUrl': webhookUrl.toString(),
        'chave': pixKey,
        'criacao': creation.toRFC3339(),
      };
}
