class HttpError {
  int? code;
  String? message;
  String? details;

  HttpError({
    this.code,
    this.message,
    this.details,
  });

  factory HttpError.fromJson(Map<String, dynamic> json) {
    return HttpError(
      code: json['code'],
      message: json['message'],
      details: json['details'],
    );
  }
}
