import '../../config/http_client/gerencia_net_plus_pix_rest_client.dart';
import '../../gerencia_net_credentials.dart';
import '../models/additional_info.dart';
import 'actions/create_due_charge.dart';
import 'models/debtor_details.dart';
import 'models/due_charge_discount.dart';
import 'models/due_charge_fine.dart';
import 'models/due_charge_interest_rates.dart';
import 'models/due_charge_reduction.dart';

class DueCharge {
  final GerenciaNetPlusPixRestClient _client;
  final GerenciaNetCredentials _credentials;

  const DueCharge({
    required GerenciaNetPlusPixRestClient client,
    required GerenciaNetCredentials credentials,
  })  : _client = client,
        _credentials = credentials;

  Future<void> createDueCharge({
    required DateTime dueDate,
    required DebtorDetails debtorDetails,
    required double originalValue,
    int? expiryDaysAfterExpiration,
    int? locationId,
    DueChargeFine? fine,
    DueChargeInterestRate? interestRate,
    DueChargeReduction? reduction,
    DueChargeDiscount? discount,
    String? payerSolicitation,
    String? txid,
    List<AdditionalInfo> additionalInfo = const [],
  }) async {
    final createDueCharge = CreateDueCharge(_client);

    await createDueCharge(
      dueDate: dueDate,
      debtorDetails: debtorDetails,
      originalValue: originalValue,
      pixKey: _credentials.pixKey,
      txid: txid,
      expiryDaysAfterExpiration: expiryDaysAfterExpiration,
      locationId: locationId,
      fine: fine,
      interestRate: interestRate,
      reduction: reduction,
      discount: discount,
      payerSolicitation: payerSolicitation,
      additionalInfo: additionalInfo,
    );
  }
}
