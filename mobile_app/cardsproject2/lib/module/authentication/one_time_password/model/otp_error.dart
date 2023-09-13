class OtpError {
  String? email;

  OtpError({
    this.email,
  });

  factory OtpError.fromJson(Map<String, dynamic> json) {
    return OtpError(
      email: json["otp"] != null ? json["otp"][0] : '',
    );
  }
}
