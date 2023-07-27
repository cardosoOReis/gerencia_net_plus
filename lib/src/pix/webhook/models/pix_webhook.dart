import '../../../config/utils/date_extensions.dart';

class PixWebhook {
  final Uri webhookUrl;
  final String pixKey;
  final DateTime creation;

  const PixWebhook({
    required this.webhookUrl,
    required this.pixKey,
    required this.creation,
  });

  factory PixWebhook.fromMap(Map<String, dynamic> map) => PixWebhook(
        webhookUrl: Uri.parse(map['webhookUrl']),
        pixKey: map['chave'],
        creation: DateTime.parse(map['criacao']),
      );

  Map<String, dynamic>? toMap() => {
        'webhookUrl': webhookUrl.toString(),
        'chave': pixKey,
        'criacao': creation.toRFC3339(),
      };
}
