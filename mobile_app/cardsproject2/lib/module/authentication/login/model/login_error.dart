class LoginError {
  String? email;
  String? password;
  String? fcmToken;

  LoginError({
    this.email,
    this.password,
    this.fcmToken,
  });

  factory LoginError.fromJson(Map<String, dynamic> json) {
    return LoginError(
      email: json["username"] != null ? json["username"][0] : '',
      password: json["password"] != null ? json["password"][0] : '',
      fcmToken: json["fcm_token"] != null ? json["fcm_token"][0] : '',
    );
  }
}
