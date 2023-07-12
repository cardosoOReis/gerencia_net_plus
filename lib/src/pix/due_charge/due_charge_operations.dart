// Project imports:
import '../../config/http_client/gerencia_net_plus_pix_rest_client.dart';
import '../../gerencia_net_credentials.dart';
import '../models/additional_info.dart';
import '../models/charge_status.dart';
import 'actions/create_due_charge.dart';
import 'actions/detail_due_charge.dart';
import 'actions/list_due_charges.dart';
import 'actions/update_due_charge.dart';
import 'models/debtor_details.dart';
import 'models/due_charge.dart';
import 'models/due_charge_discount.dart';
import 'models/due_charge_fine.dart';
import 'models/due_charge_interest_rates.dart';
import 'models/due_charge_pagination.dart';
import 'models/due_charge_reduction.dart';

class DueChargeOperations {
  final GerenciaNetPlusPixRestClient _client;
  final GerenciaNetCredentials _credentials;

  const DueChargeOperations({
    required GerenciaNetPlusPixRestClient client,
    required GerenciaNetCredentials credentials,
  })  : _client = client,
        _credentials = credentials;

  Future<DueCharge> createDueCharge({
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

    return createDueCharge(
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

  Future<DueCharge> updateDueCharge({
    required String txid,
    DateTime? dueDate,
    DebtorDetails? debtorDetails,
    double? originalValue,
    String? pixKey,
    int? expiryDaysAfterExpiration,
    int? locationId,
    ChargeStatus? status,
    DueChargeFine? fine,
    DueChargeInterestRate? interestRate,
    DueChargeReduction? reduction,
    DueChargeDiscount? discount,
    String? payerSolicitation,
    List<AdditionalInfo>? additionalInfo,
  }) async {
    final updateDueCharge = UpdateDueCharge(_client);

    return updateDueCharge(
      txid,
      dueDate: dueDate,
      debtorDetails: debtorDetails,
      originalValue: originalValue,
      pixKey: pixKey,
      expiryDaysAfterExpiration: expiryDaysAfterExpiration,
      locationId: locationId,
      fine: fine,
      status: status,
      interestRate: interestRate,
      reduction: reduction,
      discount: discount,
      payerSolicitation: payerSolicitation,
      additionalInfo: additionalInfo,
    );
  }

  Future<DueCharge> detailDueCharge(
    String txid, {
    int? revision,
  }) async {
    final detailDueCharge = DetailDueCharge(_client);

    return detailDueCharge(txid, revision: revision);
  }

  Future<DueChargePagination> listDueCharges({
    required DateTime start,
    required DateTime end,
    String? cpf,
    String? cnpj,
    bool? hasLocation,
    ChargeStatus? status,
    int? idDueChargeBatch,
    int? itemAmount,
    int? pageNumber,
  }) async {
    final listDueCharges = ListDueCharges(_client);

    return listDueCharges(
      start: start,
      end: end,
      cpf: cpf,
      cnpj: cnpj,
      hasLocation: hasLocation,
      status: status,
      idDueChargeBatch: idDueChargeBatch,
      pageNumber: pageNumber,
      itemAmount: itemAmount,
    );
  }
}
