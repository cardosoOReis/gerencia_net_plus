// Project imports:
import '../../../../config/utils/map_extensions.dart';
import '../../models/payee_details.dart';

class SendPixRequestBody {
  final double value;
  final String payerPixKey;
  final PayeeDetails payeeDetails;
  final String? payerInfo;

  const SendPixRequestBody({
    required this.value,
    required this.payerPixKey,
    required this.payeeDetails,
    required this.payerInfo,
  });

  Map<String, dynamic> toMap() => <String, dynamic>{
        'valor': value.toStringAsFixed(2),
        'pagador': {
          'chave': payerPixKey,
        }..addIfNotNull('infoPagador', payerInfo),
        'favorecido': payeeDetails.toMap(),
      };
}
