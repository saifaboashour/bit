class HttpError<J> {
  int? code;
  String? message;
  String? localError;
  J? details;

  HttpError({
    this.code,
    this.message,
    this.localError,
    this.details,
  });

  factory HttpError.fromJson(
      Map<String, dynamic> json, Function(Map<String, dynamic>)? buildError) {
    return HttpError(
      code: json['code'],
      message: json['message'],
      details: buildError != null ? buildError(json['errors']) : null,
    );
  }
}
