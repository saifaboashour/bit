class RegisterResponse {
  String? otpToken;

  RegisterResponse({
    this.otpToken,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      otpToken: json["otp_token"],
    );
  }
}
