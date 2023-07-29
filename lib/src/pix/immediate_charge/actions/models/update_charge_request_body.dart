// Project imports:
import '../../../models/additional_info.dart';
import '../../../models/charge_status.dart';
import '../../models/debtor.dart';

class UpdateChargeRequestBody {
  final int? locId;
  final Debtor? debtor;
  final double? value;
  final String? payerSolicitation;
  final ChargeStatus? status;
  final String? pixKey;
  final List<AdditionalInfo>? additionalInfo;

  const UpdateChargeRequestBody({
    required this.locId,
    required this.debtor,
    required this.value,
    required this.payerSolicitation,
    required this.status,
    required this.pixKey,
    required this.additionalInfo,
  });

  Map<String, dynamic> toMap() {
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
  }
}
