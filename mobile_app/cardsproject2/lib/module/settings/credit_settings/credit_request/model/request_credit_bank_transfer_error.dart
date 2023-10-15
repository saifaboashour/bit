class RequestCreditBankTransferError {
  String? image;
  String? amount;
  String? notes;
  String? supportedAccountId;

  RequestCreditBankTransferError({
    this.image,
    this.amount,
    this.notes,
    this.supportedAccountId,
  });

  factory RequestCreditBankTransferError.fromJson(Map<String, dynamic> json) {
    return RequestCreditBankTransferError(
      image: json["image"] != null ? json["image"][0] : '',
      amount: json["amount"] != null ? json["amount"][0] : '',
      notes: json["notes"] != null ? json["notes"][0] : '',
      supportedAccountId: json["supported_account_id"] != null
          ? json["supported_account_id"][0]
          : '',
    );
  }
}
