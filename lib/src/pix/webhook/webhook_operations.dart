// Project imports:
import '../../config/http_client/gerencia_net_plus_pix_rest_client.dart';
import '../../core/gerencia_net_credentials.dart';
import 'actions/cancel_webhook.dart';
import 'actions/configure_webhook.dart';
import 'actions/detail_webhook.dart';
import 'actions/list_webhooks.dart';
import 'models/pix_webhook.dart';
import 'models/pix_webhook_pagination.dart';

class WebhookOperations {
  final GerenciaNetPlusPixRestClient _client;
  final GerenciaNetCredentials _credentials;

  const WebhookOperations({
    required GerenciaNetPlusPixRestClient client,
    required GerenciaNetCredentials credentials,
  })  : _client = client,
        _credentials = credentials;

  Future<Uri> configureWebhook({
    required Uri webhook,
    String? pixKey,
  }) async {
    final configWebhook = ConfigureWebhook(_client);

    return configWebhook(
      webhookUrl: webhook,
      pixKey: pixKey ?? _credentials.pixKey,
    );
  }

  Future<PixWebhook> detailWebhook({String? pixKey}) async {
    final detailWebhook = DetailWebhook(_client);

    return detailWebhook(pixKey ?? _credentials.pixKey);
  }

  Future<PixWebhookPagination> listWebhooks({
    required DateTime start,
    required DateTime end,
    int? pageSize,
    int? pageNumber,
  }) async {
    final listWebhooks = ListWebhook(_client);

    return listWebhooks(
      start: start,
      end: end,
      pageSize: pageSize,
      pageNumber: pageNumber,
    );
  }

  Future<void> cancelWebhook({String? pixKey}) async {
    final cancelWebhook = CancelWebhook(_client);

    await cancelWebhook(pixKey ?? _credentials.pixKey);
  }
}
