// Project imports:
import '../../config/http_client/gerencia_net_plus_pix_rest_client.dart';
import '../../gerencia_net_credentials.dart';
import '../models/additional_info.dart';
import '../models/charge_status.dart';
import 'actions/create_immediate_charge.dart';
import 'actions/detail_immediate_charge.dart';
import 'actions/list_immediate_charges.dart';
import 'actions/update_immediate_charge.dart';
import 'models/debtor.dart';
import 'models/pix_immediate_charge.dart';
import 'models/pix_immediate_charge_list.dart';

/// Groups all available Immediate Charge operations
class ImmediateCharge {
  final GerenciaNetPlusPixRestClient _client;
  final GerenciaNetCredentials _credentials;

  /// Default Constructor
  const ImmediateCharge({
    required GerenciaNetPlusPixRestClient client,
    required GerenciaNetCredentials credentials,
  })  : _client = client,
        _credentials = credentials;

  /// Creates an Immediate Charge with the given [value]
  ///
  ///
  /// You can specify an optional [expiration] duration, which
  /// sets a deadline for the payer to complete the payment. If no deadline is
  /// provided, the expiration will default to 30 days.
  ///
  /// Optionally, you can assign a unique identifier to the immediate charge by
  /// providing the [txid] parameter. An txid must have a length of 26-35, and
  /// also contain only the characters a-z, A-Z and 0-9. A valid [txid] Regex
  /// is ^[a-zA-Z0-9]{26,35}$.  If you leave it empty, a random identifier
  /// will be generated for the charge.
  ///
  /// If this charge is set to a specific person, the [debtor] parameter allows
  /// you to specify the person responsible for paying the immediate charge.
  /// They can be either a [PhysicalPerson] or a [LegalPerson].
  ///
  /// If you wish to include additional context or instructions for the payer,
  /// you can utilize the [payerSolicitation] parameter, which allows you to
  /// provide a solicitation message. Moreover, the [additionalInfo] parameter
  /// enables you to include any supplementary information that may be relevant
  /// to the immediate charge, such as order details or a reference number.
  Future<PixImmediateCharge> createCharge({
    required double value,
    Duration? expiration,
    String? txid,
    Debtor? debtor,
    String? payerSolicitation,
    List<AdditionalInfo> additionalInfo = const [],
  }) async {
    final pixCreateCharge = PixCreateCharge(_client);

    return pixCreateCharge(
      credentials: _credentials,
      expiration: expiration,
      txid: txid,
      value: value,
      debtor: debtor,
      payerSolicitation: payerSolicitation,
      additionalInfo: additionalInfo,
    );
  }

  /// Updates an Immediate Charge with the given [txid]

  /// This function allows you to update an existing Immediate Charge with new
  /// information. By providing the necessary parameters, you can modify various
  /// aspects of the charge to reflect changes or updates.
  ///
  /// To update an immediate charge, you need to provide the unique identifier
  /// of the charge using the [txid] parameter. This identifier ensures that the
  /// correct charge is being updated. Additionally, you can specify the
  /// [persist] parameter, which determines whether the only changes made to the
  /// charge are the ones passed. If set to true, the only changes made are the
  /// ones passed in the parameters. Otherwise, this is the same thing as
  /// creating a new Immediate Charge, while maintaining the same [txid].
  ///
  /// The [value] parameter allows you to change the amount of money associated
  /// with the immediate charge. By providing a new value, you can update the
  /// payment amount. Similarly, the [locId] parameter enables you to update the
  /// location identifier associated with the charge, if applicable.
  ///
  /// If you wish to modify the debtor associated with the immediate charge, you
  /// can provide a new [debtor] object containing the updated debtor
  /// information. Additionally, you can change the [status] of the charge to
  /// reflect its current state accurately.
  ///
  /// To update the Pix key associated with the charge, you can provide a new
  /// [pixKey]. This is useful when changing the recipient's Pix key for the
  /// payment. Furthermore, you can modify the [additionalInfo] parameter to
  /// include any additional or updated information related to the immediate
  /// charge, such as updated order details or reference numbers.
  ///
  /// Finally, the [payerSolicitation] parameter allows you to update the
  /// solicitation message that can be sent to the payer, providing updated
  /// instructions or additional context.
  Future<PixImmediateCharge> updateCharge({
    required String txid,
    bool persist = true,
    double? value,
    int? locId,
    Debtor? debtor,
    ChargeStatus? status,
    String? pixKey,
    List<AdditionalInfo>? additionalInfo,
    String? payerSolicitation,
  }) async {
    final pixUpdateCharge = PixUpdateCharge(_client);

    return pixUpdateCharge(
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

  /// Details an Immediate Charge with the given [txid]
  ///
  /// Optionally, you can specify the [revision] parameter to retrieve a
  /// specific revision of the charge. If provided, the function will return
  /// the charge as it existed at the specified revision. If no revision is
  /// specified, the function will return the most recent version of the charge.
  Future<PixImmediateCharge> detailCharge(
    String txid, {
    int? revision,
  }) async {
    final pixDetailCharge = PixDetailCharge(_client);

    return pixDetailCharge(
      txid: txid,
      revision: revision,
    );
  }

  /// Retrieves a list of Immediate Charges within a specified timeframe.
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
  /// PixStatus value, allowing you to focus on charges with specific processing
  /// statuses.
  /// 
  /// If there are multiple pages of charges available, you can specify the 
  /// desired [pageNumber] to retrieve a specific page. Additionally, you can 
  /// control the number of charges to retrieve per page by providing the 
  /// [itemAmount] parameter. This allows you to customize the pagination and 
  /// retrieve charges in a suitable manner.
  Future<PixImmediateChargeList> listCharges({
    required DateTime start,
    required DateTime end,
    String? cpf,
    String? cnpj,
    ChargeStatus? status,
    int? pageNumber,
    int? itemAmount,
  }) async {
    final pixListCharges = PixListCharges(_client);

    return pixListCharges(
      start: start,
      end: end,
      cpf: cpf,
      cnpj: cnpj,
      status: status,
      pageNumber: pageNumber,
      itemAmount: itemAmount,
    );
  }
}
