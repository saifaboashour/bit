import 'package:cardsproject2/service/http_client/model/general_response.dart';
import 'package:cardsproject2/service/http_client/model/http_error.dart';
import 'package:cardsproject2/util/constants.dart';
import 'package:http/http.dart' as http;

import 'http_helper.dart';

class HttpClient<T> {
  String baseUrl = AppConstants.baseUrl;

  T Function(Map<String, dynamic>)? objectFromJson;
  List<T> Function(Map<String, dynamic>)? arrayFromJson;

  HttpClient(this.objectFromJson, {this.arrayFromJson});

  Future<GeneralResponse<T>> get(
    String path, {
    bool isAuthRequired = true,
    Map<String, dynamic>? parameters,
  }) async {
    String url = baseUrl + path;
    Uri uri = Uri.parse(url).replace(queryParameters: parameters);
    try {
      http.Response response = await http
          .get(
            uri,
            headers: HttpHelper.getHeader(isAuthRequired),
          )
          .timeout(
            AppConstants.requestTimeout,
          );

      return HttpHelper.handleResponse<T>(response, objectFromJson);
    } catch (e) {
      return GeneralResponse(
        success: false,
        data: null,
        error: HttpError(
          code: 1337,
          message: 'Something Went Wrong. Please Contant your Provider.',
          details: '$e',
        ),
      );
    }
  }

  Future<GeneralResponse<T>> post(
    String path,
    Map<String, dynamic> requestBody, {
    bool isAuthRequired = true,
  }) async {
    String url = baseUrl + path;
    Uri uri = Uri.parse(url);
    try {
      http.Response response = await http
          .post(
            uri,
            body: requestBody,
            headers: HttpHelper.getHeader(isAuthRequired),
          )
          .timeout(
            AppConstants.requestTimeout,
          );

      return HttpHelper.handleResponse<T>(response, objectFromJson);
    } catch (e) {
      return GeneralResponse(
        success: false,
        data: null,
        error: HttpError(
          code: 1337,
          message: 'Something Went Wrong. Please Contant your Provider.',
          details: '$e',
        ),
      );
    }
  }

  Future<GeneralResponse<T>> put(
    String path,
    Map<String, dynamic> requestBody, {
    bool isAuthRequired = true,
  }) async {
    String url = baseUrl + path;
    Uri uri = Uri.parse(url);
    try {
      http.Response response = await http
          .put(
            uri,
            body: requestBody,
            headers: HttpHelper.getHeader(isAuthRequired),
          )
          .timeout(
            AppConstants.requestTimeout,
          );

      return HttpHelper.handleResponse<T>(response, objectFromJson);
    } catch (e) {
      return GeneralResponse(
        success: false,
        data: null,
        error: HttpError(
          code: 1337,
          message: 'Something Went Wrong. Please Contant your Provider.',
          details: '$e',
        ),
      );
    }
  }

  Future<GeneralResponse<T>> delete(
    String path, {
    bool isAuthRequired = true,
  }) async {
    String url = baseUrl + path;
    Uri uri = Uri.parse(url);
    try {
      http.Response response = await http
          .delete(
            uri,
            headers: HttpHelper.getHeader(isAuthRequired),
          )
          .timeout(
            AppConstants.requestTimeout,
          );

      return HttpHelper.handleResponse<T>(response, objectFromJson);
    } catch (e) {
      return GeneralResponse(
        success: false,
        data: null,
        error: HttpError(
          code: 1337,
          message: 'Something Went Wrong. Please Contant your Provider.',
          details: '$e',
        ),
      );
    }
  }
}
