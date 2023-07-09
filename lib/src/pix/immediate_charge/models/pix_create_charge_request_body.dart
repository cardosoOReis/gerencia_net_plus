// Project imports:
import '../../../gerencia_net_credentials.dart';
import '../../models/additional_info.dart';
import 'debtor.dart';

class PixCreateChargeRequestBody {
  final GerenciaNetCredentials credentials;
  final Duration? expiration;
  final double value;
  final List<AdditionalInfo> additionalInfo;
  final Debtor? debtor;
  final String? payerSolicitation;

  const PixCreateChargeRequestBody({
    required this.credentials,
    required this.expiration,
    required this.value,
    required this.payerSolicitation,
    required this.debtor,
    this.additionalInfo = const [],
  });

  Map<String, dynamic> toMap() {
    final body = <String, dynamic>{
      'calendario': {},
      'valor': {
        'original': value.toStringAsFixed(2),
      },
      'chave': credentials.pixKey,
    };
    if (expiration != null) {
      body['calendario']['expiracao'] = expiration?.inSeconds;
    }
    if (debtor != null) {
      body.addAll({
        'devedor': debtor?.toMap(),
      });
    }
    if (payerSolicitation != null) {
      body.addAll({
        'solicitacaoPagador': payerSolicitation,
      });
    }
    if (additionalInfo.isNotEmpty) {
      body.addAll({
        'infoAdicionais': additionalInfo.map((e) => e.toMap()).toList(),
      });
    }
    return body;
  }
}
