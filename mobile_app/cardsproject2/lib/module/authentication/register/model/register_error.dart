class RegisterError {
  String? name;
  String? email;
  String? phone;
  String? password;
  String? address;
  String? commercialName;
  String? fcmToken;
  String? countryId;
  String? stateId;
  String? currencyId;

  RegisterError({
    this.name,
    this.email,
    this.phone,
    this.password,
    this.address,
    this.commercialName,
    this.fcmToken,
    this.countryId,
    this.stateId,
    this.currencyId,
  });

  factory RegisterError.fromJson(Map<String, dynamic> json) {
    return RegisterError(
      name: json["name"] != null ? json["name"][0] : '',
      email: json["email"] != null ? json["email"][0] : '',
      phone: json["phone"] != null ? json["phone"][0] : '',
      password: json["password"] != null ? json["password"][0] : '',
      address: json["address"] != null ? json["address"][0] : '',
      commercialName:
          json["commercial_name"] != null ? json["commercial_name"][0] : '',
      fcmToken: json["fcm_token"] != null ? json["fcm_token"][0] : '',
      countryId: json["country_id"] != null ? json["country_id"][0] : '',
      stateId: json["state_id"] != null ? json["state_id"][0] : '',
      currencyId: json["currency_id"] != null ? json["currency_id"][0] : '',
    );
  }
}
