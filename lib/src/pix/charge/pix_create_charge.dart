import 'dart:math';

import '../../config/http_client/gerencia_net_plus_pix_rest_client.dart';
import '../../gerencia_net_credentials.dart';
import '../models/additional_info.dart';
import '../models/debtor.dart';
import 'models/pix_create_charge_response.dart';

class PixCreateCharge {
  final GerenciaNetPlusPixRestClient client;

  const PixCreateCharge(this.client);

  Future<PixCreateChargeResponse> call({
    required GerenciaNetCredentials credentials,
    required Duration expiration,
    required double value,
    String? txid,
    Debtor? debtor,
    String? payerSolicitation,
    List<AdditionalInfo> additionalInfo = const [],
  }) async {
    final body = <String, dynamic>{
      'calendario': {
        'expiracao': expiration.inMilliseconds,
      },
      'valor': {
        'original': value.toStringAsFixed(2),
      },
      'chave': credentials.pixKey,
    };
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

    final endPoint = client.pixEndPoints.charge.pixCreateCharge(
      txid ?? _generateRandomTXID(),
    );

    final response = await client<Map<String, dynamic>>(endPoint: endPoint, body: body);
    return PixCreateChargeResponse(response.data!);
  }

  String _generateRandomTXID() {
    /// A valid txid must be 26-35 characters long and only contain a-z, A-Z, 0-9
    final random = Random.secure();
    final txidLength = random.nextInt(10) + 26;
    final allowedCharacters =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';

    return List.generate(txidLength, (_) {
      final index = random.nextInt(allowedCharacters.length);
      return allowedCharacters[index];
    }).join();
  }
}
