// Project imports:
import '../../config/http_client/gerencia_net_plus_pix_rest_client.dart';
import '../../config/utils/txid.dart' as txid_utils;
import '../../core/gerencia_net_credentials.dart';
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

/// Groups all available operations related to Due Charges.
class DueChargeOperations {
  final GerenciaNetPlusPixRestClient _client;
  final GerenciaNetCredentials _credentials;

  /// Groups all available operations related to Due Charges
  const DueChargeOperations({
    required GerenciaNetPlusPixRestClient client,
    required GerenciaNetCredentials credentials,
  })  : _client = client,
        _credentials = credentials;

  /// Creates a new Due Charge.
  ///
  /// This method allows you to create a Due Charge, representing a payment
  /// request using the Pix payment method that has an expiration date set in
  /// the future. You must provide the [dueDate] for the charge and specify
  /// the [debtorDetails], which contains the information about the person
  /// responsible for paying the Due Charge. Additionally, you need to set the
  /// [originalValue] of the charge.
  ///
  /// You can optionally provide the [expiryDaysAfterExpiration] to define a
  /// deadline after the expiration date for the payer to complete the payment.
  /// If not specified, the deadline will default to 30 days.
  ///
  /// Moreover, you can include the [locationId] to set the location identifier
  /// for the charge, if applicable.
  ///
  /// The [fine], [interestRate], [reduction], and [discount] parameters allow
  /// you to specify additional details related to charges, such as fine and
  /// interest rates, reductions, and discounts.
  ///
  /// If you wish to include any payer solicitation or instructions, you can
  /// use the [payerSolicitation] parameter to provide a solicitation message.
  ///
  /// To track and identify the Due Charge, you can assign a unique identifier
  /// to the charge using the [txid] parameter. A valid [txid] should have a
  /// length of 26-35 characters and contain only the characters a-z, A-Z, and
  /// 0-9. A valid [txid] should match the regex ^[a-zA-Z0-9]{26,35}$. If left
  /// empty, a random identifier will be generated for the charge.
  ///
  /// Additionally, you can provide a list of [additionalInfo] containing
  /// supplementary information relevant to the charge, such as order details or
  /// reference numbers.
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
      txid: txid ?? txid_utils.generate(),
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

  /// Updates an existing Due Charge.
  ///
  /// This method allows you to update an existing Due Charge with new
  /// information. By providing the necessary parameters, you can modify various
  /// aspects of the charge.
  ///
  /// To update a Due Charge, you need to provide the unique identifier
  /// of the charge using the [txid] parameter. This identifier ensures that the
  /// correct charge is being updated.
  ///
  /// The [dueDate], [debtorDetails], and [originalValue] parameters allow you
  /// to change the due date, debtor details, and the original value of the Due
  /// Charge, respectively.
  ///
  /// You can also modify the [pixKey] associated with the charge, if needed.
  ///
  /// Additionally, you can provide the [expiryDaysAfterExpiration] to update
  /// the deadline for the payer to complete the payment.
  ///
  /// The [locationId] parameter allows you to update the location identifier
  /// associated with the charge, if applicable.
  ///
  /// The [status] parameter enables you to change the status of the charge to
  /// reflect its current state accurately.
  ///
  /// The [fine], [interestRate], [reduction], and [discount] parameters allow
  /// you to update the additional details of the Due Charge.
  ///
  /// To provide any payer solicitation or instructions, you can use the
  /// [payerSolicitation] parameter to update the solicitation message.
  ///
  /// If needed, you can modify the [additionalInfo] parameter to include or
  /// update supplementary information relevant to the charge.
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

  /// Details a Due Charge with the given [txid].
  ///
  /// Optionally, you can specify the [revision] parameter to retrieve a
  /// specific revision of the charge. If provided, the function will return
  /// the charge as it existed at the specified revision. If no revision is
  /// specified, the function will return the most recent version of the charge.
  Future<DueCharge> detailDueCharge(
    String txid, {
    int? revision,
  }) async {
    final detailDueCharge = DetailDueCharge(_client);

    return detailDueCharge(txid, revision: revision);
  }

  /// Retrieves a list of Due Charges within a specified timeframe.
  ///
  /// By providing the [start] and [end] parameters, you can define the desired
  /// period for which you want to retrieve the charges. This allows you to
  /// fetch charges created during a specific timeframe.
  ///
  /// Optionally, you can further refine the search results by utilizing
  /// additional parameters. For example, you can provide a [cpf]
  /// (Brazilian individual taxpayer registry) or [cnpj] (Brazilian corporate
  /// taxpayer registry) to filter charges associated with specific entities.
  /// Moreover, you can specify a [status] to retrieve charges with a particular
  /// [SentPixStatus] value, allowing you to focus on charges with specific
  /// processing statuses.
  ///
  /// If there are multiple pages of charges available, you can specify the
  /// desired [pageNumber] to retrieve a specific page. Additionally, you can
  /// control the number of charges to retrieve per page by providing the
  /// [pageSize] parameter. This allows you to customize the pagination and
  /// retrieve charges in a suitable manner.
  Future<DueChargePagination> listDueCharges({
    required DateTime start,
    required DateTime end,
    String? cpf,
    String? cnpj,
    bool? hasLocation,
    ChargeStatus? status,
    int? idDueChargeBatch,
    int? pageSize,
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
      pageSize: pageSize,
    );
  }
}
