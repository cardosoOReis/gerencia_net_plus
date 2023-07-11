// Dart imports:
import 'dart:convert';

// Project imports:
import '../../models/additional_info.dart';
import '../../models/charge_status.dart';
import 'debtor.dart';

class PixUpdateChargeRequestBody {
  final int? locId;
  final Debtor? debtor;
  final double? value;
  final String? payerSolicitation;
  final ChargeStatus? status;
  final String? pixKey;
  final List<AdditionalInfo>? additionalInfo;

  const PixUpdateChargeRequestBody({
    required this.locId,
    required this.debtor,
    required this.value,
    required this.payerSolicitation,
    required this.status,
    required this.pixKey,
    required this.additionalInfo,
  });

  Map<String, dynamic> toMap({bool persist = true}) {
    if (persist) {
      final body = <String, dynamic>{};

      if (locId != null) {
        body.addAll({
          'loc': {
            'id': locId,
          },
        });
      }
      if (debtor != null) {
        body.addAll({'devedor': debtor!.toMap()});
      }
      if (value != null) {
        body.addAll({
          'valor': {
            'original': value?.toStringAsFixed(2),
          },
        });
      }
      if (payerSolicitation != null) {
        body.addAll({
          'solicitacaoPagador': payerSolicitation,
        });
      }
      if (status != null) {
        body.addAll({
          'status': status!.value,
        });
      }
      if (pixKey != null) {
        body.addAll({
          'chave': pixKey,
        });
      }
      if (additionalInfo != null && additionalInfo!.isNotEmpty) {
        body.addAll({
          'infoAdicionais': additionalInfo?.map((x) => x.toMap()).toList(),
        });
      }

      return body;
    } else {
      final body = {
        'loc': {
          'id': locId,
        },
        'devedor': debtor?.toMap(),
        'valor': {
          'original': value,
        },
        'solicitacaoPagador': payerSolicitation,
        'status': status?.value,
        'chave': pixKey,
      };

      return body;
    }
  }

  String toJson() => json.encode(toMap());
}
