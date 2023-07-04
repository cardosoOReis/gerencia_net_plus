// Project imports:
import 'package:gerencia_net_plus/src/gerencia_net_credentials.dart';
import 'package:gerencia_net_plus/src/pix/models/additional_info.dart';
import 'package:gerencia_net_plus/src/pix/models/debtor.dart';

class PixCreateChargeRequestBody {
  final GerenciaNetCredentials credentials;
  final Duration expiration;
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
      'calendario': {
        'expiracao': expiration.inMilliseconds,
      },
      'valor': {
        'original': value.toStringAsFixed(2),
      },
      'chave': credentials.pixKey,
    };
    final debtor = this.debtor;
    if (debtor != null) {
      body.addAll({
        'devedor': switch (debtor) {
          PhysicalPersonDebtor() => {
              'cpf': debtor.cpf,
              'nome': debtor.name,
            },
          LegalPersonDebtor() => {
              'cnpj': debtor.cnpj,
              'nome': debtor.name,
            },
        }
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
