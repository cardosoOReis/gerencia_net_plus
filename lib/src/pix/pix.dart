import 'package:gerencia_net_plus/src/pix/charge/pix_update_charge.dart';
import 'package:gerencia_net_plus/src/pix/models/pix_status.dart';

import '../config/http_client/gerencia_net_plus_pix_rest_client.dart';
import '../gerencia_net_credentials.dart';
import 'charge/models/pix_charge_response.dart';
import 'charge/pix_create_charge.dart';
import 'charge/pix_create_immediate_charge.dart';
import 'models/additional_info.dart';
import 'models/debtor.dart';

class Pix {
  final GerenciaNetCredentials credentials;
  final GerenciaNetPlusPixRestClient client;

  const Pix({
    required this.credentials,
    required this.client,
  });

  Future<PixCharge> createCharge({
    required Duration expiration,
    required double value,
    String? txid,
    Debtor? debtor,
    String? payerSolicitation,
    List<AdditionalInfo> additionalInfo = const [],
  }) async {
    final pixCreateCharge = PixCreateCharge(client);

    return await pixCreateCharge(
      credentials: credentials,
      expiration: expiration,
      txid: txid,
      value: value,
      debtor: debtor,
      payerSolicitation: payerSolicitation,
      additionalInfo: additionalInfo,
    );
  }

  Future<PixCharge> createImmediateCharge({
    required Duration expiration,
    required double value,
    Debtor? debtor,
    String? payerSolicitation,
    List<AdditionalInfo> additionalInfo = const [],
  }) async {
    final pixCreateImmediateCharge = PixCreateImmediateCharge(client);

    return await pixCreateImmediateCharge(
      credentials: credentials,
      value: value,
      expiration: expiration,
      debtor: debtor,
      payerSolicitation: payerSolicitation,
      additionalInfo: additionalInfo,
    );
  }

  Future<PixCharge> updateCharge({
    required String txid,
    bool? persist,
    double? value,
    int? locId,
    Debtor? debtor,
    PixStatus? status,
    String? pixKey,
    List<AdditionalInfo>? additionalInfo,
    String? payerSolicitation,
  }) async {
    final pixUpdateCharge = PixUpdateCharge(client);

    return await pixUpdateCharge(
      txid: txid,
      
      value: value,
      locId: locId,
      debtor: debtor,
      status: status,
      pixKey: pixKey,
      additionalInfo: additionalInfo,
      payerSolicitation: payerSolicitation,
    );
  }
}
