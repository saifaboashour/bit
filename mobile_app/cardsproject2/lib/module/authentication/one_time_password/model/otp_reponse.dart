class OtpResponse {
  final String? accesstoken;
  final String? refreshToken;
  final String? accessTokenExpiry;

  OtpResponse({
    this.accesstoken,
    this.refreshToken,
    this.accessTokenExpiry,
  });

  factory OtpResponse.fromJson(Map<String, dynamic> json) {
    return OtpResponse(
      accesstoken: json['access_token'],
      refreshToken: json['refresh_token'],
      accessTokenExpiry: json['access_token_expiry'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'access_token': accesstoken,
      'refresh_token': refreshToken,
      'access_token_expiry': accessTokenExpiry,
    };
  }
}
