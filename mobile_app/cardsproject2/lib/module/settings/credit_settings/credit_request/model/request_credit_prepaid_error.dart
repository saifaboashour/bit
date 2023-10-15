class RequestCreditPrepaidError {
  String? cardNumber;

  RequestCreditPrepaidError({
    this.cardNumber,
  });

  factory RequestCreditPrepaidError.fromJson(Map<String, dynamic> json) {
    return RequestCreditPrepaidError(
      cardNumber: json["number"] != null ? json["number"][0] : '',
    );
  }
}
