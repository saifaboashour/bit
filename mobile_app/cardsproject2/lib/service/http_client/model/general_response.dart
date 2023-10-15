import 'http_error.dart';

class GeneralResponse<T, J> {
  bool success;
  T? data;
  List<T>? listData;
  HttpError<J>? error;

  GeneralResponse({
    required this.success,
    this.data,
    this.error,
    this.listData,
  });

  factory GeneralResponse.fromJson(
    Map<String, dynamic> json,
    Function(Map<String, dynamic>)? build,
    Function(Map<String, dynamic>)? buildError, {
    bool isList = false,
    bool isPageination = false,
  }) {
    if (isPageination) {
      return GeneralResponse(
        success: json['data'] != null ? true : false,
        data: build != null ? build(json) : null,
        error:
            json['error'] != null ? HttpError.fromJson(json, buildError) : null,
      );
    }
    if (isList) {
      List<T> tmpList = [];
      if (json['data'] != null && build != null) {
        json['data'].forEach((element) {
          tmpList.add(build(element));
        });
      }
      return GeneralResponse(
        success: json['data'] != null ? true : false,
        listData: tmpList,
        error:
            json['error'] != null ? HttpError.fromJson(json, buildError) : null,
      );
    }
    return GeneralResponse(
      success: json['data'] != null ? true : false,
      data: build != null ? build(json['data']) : null,
      error:
          json['error'] != null ? HttpError.fromJson(json, buildError) : null,
    );
  }
}
