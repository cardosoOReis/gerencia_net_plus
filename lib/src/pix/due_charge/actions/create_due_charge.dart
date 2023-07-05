class CreateDueCharge {
  Future<PixDueCharge> call({
    required DateTime dueDate,
    required DebtorDetails debtorDetails,
    int? expiryDaysAfterExpiration,
    int? locationId,
  }) {}
}
