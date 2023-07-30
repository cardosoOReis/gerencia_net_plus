// Project imports:
import '../../config/http_client/gerencia_net_plus_pix_rest_client.dart';
import '../../core/gerencia_net_credentials.dart';
import 'actions/cancel_webhook.dart';
import 'actions/configure_webhook.dart';
import 'actions/detail_webhook.dart';
import 'actions/list_webhooks.dart';
import 'models/pix_webhook.dart';
import 'models/pix_webhook_pagination.dart';

/// Groups all available operations related to PIX webhooks.
///
/// This class provides methods to interact with PIX webhooks, including
/// configuring a webhook, retrieving webhook details, listing webhooks, and
/// canceling a webhook.
class WebhookOperations {
  final GerenciaNetPlusPixRestClient _client;
  final GerenciaNetCredentials _credentials;

  /// Groups all available operations related to PIX webhooks.
  ///
  /// This class provides methods to interact with PIX webhooks, including
  /// configuring a webhook, retrieving webhook details, listing webhooks, and
  /// canceling a webhook.
  const WebhookOperations({
    required GerenciaNetPlusPixRestClient client,
    required GerenciaNetCredentials credentials,
  })  : _client = client,
        _credentials = credentials;

  /// Configures a webhook for PIX transactions.
  ///
  /// The [webhook] parameter specifies the URL to which the webhook
  /// notifications will be sent.
  ///
  /// Additionally, the [pixKey] parameter (if
  /// provided) sets a specific PIX key for which the webhook is configured.
  /// If [pixKey] is not provided, the method uses the PIX key from the
  /// [GerenciaNetCredentials].
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

  /// Retrieves the details of a webhook for a specific PIX key.
  ///
  /// The [pixKey] parameter (if provided) specifies the PIX key for which the
  /// webhook details are retrieved. If [pixKey] is not provided, the method
  /// uses the PIX key from the [GerenciaNetCredentials].
  Future<PixWebhook> detailWebhook({String? pixKey}) async {
    final detailWebhook = DetailWebhook(_client);

    return detailWebhook(pixKey ?? _credentials.pixKey);
  }

  /// Retrieves a paginated list of webhooks within a specified timeframe.
  ///
  /// The [start] and [end] parameters define the period for which the webhooks
  /// are retrieved. The optional [pageSize] parameter allows you to specify the
  /// number of webhooks to retrieve per page, and the [pageNumber] parameter
  /// allows you to specify the desired page number.
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

  /// Cancels the webhook for a specific PIX key.
  ///
  /// The [pixKey] parameter (if provided) specifies the PIX key for which the
  /// webhook is canceled. If [pixKey] is not provided, the method uses the PIX
  /// key from the [GerenciaNetCredentials].
  Future<void> cancelWebhook({String? pixKey}) async {
    final cancelWebhook = CancelWebhook(_client);

    await cancelWebhook(pixKey ?? _credentials.pixKey);
  }
}
