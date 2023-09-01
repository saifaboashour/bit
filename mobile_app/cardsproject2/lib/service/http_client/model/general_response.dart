import 'http_error.dart';

class GeneralResponse<T> {
  bool? success;
  T? data;
  HttpError? error;

  GeneralResponse({
    this.success,
    this.data,
    this.error,
  });

  factory GeneralResponse.fromJson(
      Map<String, dynamic> json, Function(Map<String, dynamic>)? build) {
    return GeneralResponse(
      success: json['success'],
      data: build != null ? build(json['data']) : null,
      error: json['error'] != null ? HttpError.fromJson(json['error']) : null,
    );
  }
}
