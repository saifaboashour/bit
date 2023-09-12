class LoginResponse {
  String? otpToken;

  LoginResponse({
    this.otpToken,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      otpToken: json["otp_token"],
    );
  }
}
