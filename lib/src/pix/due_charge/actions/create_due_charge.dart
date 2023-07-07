import '../models/debtor_details.dart';
import '../models/due_charge_fine.dart';
import '../models/due_charge_interest_rates.dart';

class CreateDueCharge {
  Future<PixDueCharge> call({
    required DateTime dueDate,
    required DebtorDetails debtorDetails,
    required double originalValue,
    int? expiryDaysAfterExpiration,
    int? locationId,
    DueChargeFine? dueChargeFine,
    DueChargeInterestRate? interestRate,
  }) {}
}
