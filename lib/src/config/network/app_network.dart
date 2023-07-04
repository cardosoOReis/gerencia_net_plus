// Project imports:
import 'models/end_point.dart';
import 'models/http_method.dart';

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
  PixWebHookEndPoints get webhook => PixWebHookEndPoints(url: url);
  PixChargeEndPoints get charge => PixChargeEndPoints(url: url);
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

class PixChargeEndPoints {
  final String url;

  const PixChargeEndPoints({
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

const Map<String, Map<String, dynamic>> CONSTANTS = {
  'PIX': {
    'ENDPOINTS': {
      'pixGenerateQRCode': {'route': '/v2/loc/:id/qrcode', 'method': 'get'},
      'pixDevolution': {
        'route': '/v2/pix/:e2eId/devolucao/:id',
        'method': 'put'
      },
      'pixDetailDevolution': {
        'route': '/v2/pix/:e2eId/devolucao/:id',
        'method': 'get'
      },
      'pixSend': {'route': '/v2/gn/pix/:idEnvio', 'method': 'put'},
      'pixSendList': {'route': '/v2/pix/:e2eId', 'method': 'get'},
      'pixDetail': {'route': '/v2/pix/:e2eId', 'method': 'get'},
      'pixReceivedList': {'route': '/v2/pix', 'method': 'get'},
      'pixListReceived': {'route': '/v2/pix', 'method': 'get'},
      'pixCreateLocation': {'route': '/v2/loc', 'method': 'post'},
      'pixListLocation': {'route': '/v2/loc', 'method': 'get'},
      'pixDetailLocation': {'route': '/v2/loc/:id', 'method': 'get'},
      'pixUnsetTxid': {'route': '/v2/loc/:id/txid', 'method': 'delete'},
      'gnCreateEvp': {'route': '/v2/gn/evp', 'method': 'post'},
      'gnListEvp': {'route': '/v2/gn/evp', 'method': 'get'},
      'gnDeleteEvp': {'route': '/v2/gn/evp/:chave', 'method': 'delete'},
      'gnDetailBalance': {'route': '/v2/gn/saldo', 'method': 'get'},
      'gnUpdateSettings': {'route': '/v2/gn/config', 'method': 'put'},
      'gnDetailSettings': {'route': '/v2/gn/config', 'method': 'get'},
      'pixCreateDueCharge': {'route': '/v2/cobv/:txid', 'method': 'put'},
      'pixUpdateDueCharge': {'route': '/v2/cobv/:txid', 'method': 'patch'},
      'pixDetailDueCharge': {'route': '/v2/cobv/:txid', 'method': 'get'},
      'pixListDueCharges': {'route': '/v2/cobv/', 'method': 'get'},
      'createReport': {
        'route': '/v2/gn/relatorios/extrato-conciliacao',
        'method': 'post'
      },
      'detailReport': {'route': '/v2/gn/relatorios/:id', 'method': 'get'}
    }
  },
  'OPEN-FINANCE': {
    'URL': {
      'production': 'https://apis.gerencianet.com.br/open-finance',
      'sandbox': 'https://apis-h.gerencianet.com.br/open-finance'
    },
    'ENDPOINTS': {
      'authorize': {'route': '/oauth/token', 'method': 'post'},
      'ofUpdateSettings': {'route': '/config', 'method': 'put'},
      'ofDetailSettings': {'route': '/config', 'method': 'get'},
      'ofListParticipants': {'route': '/participantes/', 'method': 'get'},
      'ofStartPixPayment': {'route': '/pagamentos/pix', 'method': 'post'},
      'ofListPixPayment': {'route': '/pagamentos/pix', 'method': 'get'}
    }
  },
  'PAGAMENTOS': {
    'URL': {
      'production': 'https://apis.gerencianet.com.br/pagamento',
      'sandbox': 'https://apis.gerencianet.com.br/pagamento'
    },
    'ENDPOINTS': {
      'authorize': {'route': '/oauth/token', 'method': 'post'},
      'payDetailBarCode': {'route': '/codBarras/:codBarras', 'method': 'get'},
      'payRequestBarCode': {'route': '/codBarras/:codBarras', 'method': 'post'},
      'payDetailPayment': {'route': '/:idPagamento', 'method': 'get'},
      'payListPayments': {'route': '/resumo', 'method': 'get'}
    }
  },
};
