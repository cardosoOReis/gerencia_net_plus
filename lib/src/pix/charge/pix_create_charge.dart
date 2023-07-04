// Dart imports:
import 'dart:math';

// Project imports:
import 'package:gerencia_net_plus/src/pix/charge/models/pix_create_charge_request_body.dart';

import '../../config/http_client/gerencia_net_plus_pix_rest_client.dart';
import '../../gerencia_net_credentials.dart';
import '../models/additional_info.dart';
import '../models/debtor.dart';
import 'models/pix_charge_response.dart';

class PixCreateCharge {
  final GerenciaNetPlusPixRestClient client;

  const PixCreateCharge(this.client);

  Future<PixChargeResponse> call({
    required GerenciaNetCredentials credentials,
    required Duration expiration,
    required double value,
    String? txid,
    Debtor? debtor,
    String? payerSolicitation,
    List<AdditionalInfo> additionalInfo = const [],
  }) async {
    final body = PixCreateChargeRequestBody(
      credentials: credentials,
      expiration: expiration,
      value: value,
      debtor: debtor,
      payerSolicitation: payerSolicitation,
      additionalInfo: additionalInfo,
    );
    final endPoint = client.pixEndPoints.charge.pixCreateCharge(
      txid ?? _generateRandomTXID(),
    );

    final response = await client<Map<String, dynamic>>(
      endPoint: endPoint,
      body: body.toMap(),
    );
    return PixChargeResponse(response.data!);
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
