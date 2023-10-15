class CreditTransaction{
  final int? id;
  final String? image;
  final int? amount;
  final String? notes;
  final String? transactionType;
  final String? transactionSource;
  final String? bankAccount;
  final String? status;
  final String? from;
  final String? dateTime;

  CreditTransaction({
    this.id,
    this.image,
    this.amount,
    this.notes,
    this.transactionType,
    this.transactionSource,
    this.bankAccount,
    this.status,
    this.from,
    this.dateTime,
  });

  factory CreditTransaction.fromJson(Map<String, dynamic> json) {
    return CreditTransaction(
      id: json['id'],
      image: json['image'],
      amount: json['amount'] ?? 0,
      notes: json['notes'],
      transactionType: json['deposit_or_withdraw'] == "0" ? "Deposit" : "Withdraw",
      transactionSource: json['credit_type'] != null ? json['credit_type']['name'] : '',
      bankAccount: json['supported_account'] != null ? json['supported_account']['name'] : '',
      status: json['credit_status'] != null ? json['credit_status']['name'] : '',
      from: json['from'] != null ? json['from']['name'] : '',
      dateTime: json['created_at'],
    );
  }
}