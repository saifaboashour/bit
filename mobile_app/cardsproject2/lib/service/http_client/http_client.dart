import 'dart:convert';
import 'dart:developer';

import 'package:cardsproject2/service/http_client/model/general_response.dart';
import 'package:cardsproject2/service/http_client/model/http_error.dart';
import 'package:cardsproject2/util/constants.dart';
import 'package:http/http.dart' as http;

import 'http_helper.dart';

class HttpClient<T, R> {
  String baseUrl = AppConstants.baseUrl;

  T Function(Map<String, dynamic>)? objectFromJson;
  R Function(Map<String, dynamic>)? errorFromJson;
  List<T> Function(Map<String, dynamic>)? arrayFromJson;

  HttpClient(this.objectFromJson, this.errorFromJson, {this.arrayFromJson});

  Future<GeneralResponse<T, R>> get(
    String path, {
    bool isAuthRequired = true,
    Map<String, dynamic>? parameters,
    bool isList = false,
    bool isPageination = false,
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

      return HttpHelper.handleResponse<T, R>(
        response,
        objectFromJson,
        errorFromJson,
        isList: isList,
        isPageination: isPageination,
      );
    } catch (e) {
      return GeneralResponse(
        success: false,
        data: null,
        error: HttpError(
          code: 1337,
          message: 'Something Went Wrong. Please Contact your Provider.',
          localError: '$e',
        ),
      );
    }
  }

  Future<GeneralResponse<T, R>> post(
    String path,
    Map<String, String> requestBody,
    List<http.MultipartFile> files, {
    bool isAuthRequired = true,
  }) async {
    String url = baseUrl + path;
    Uri uri = Uri.parse(url);
    try {
      var request = http.MultipartRequest('POST', uri)
        ..fields.addAll(requestBody)
        ..files.addAll(files)
        ..headers.addAll(HttpHelper.getHeader(isAuthRequired));
      var response = await request.send();

      http.Response httpResponse = await http.Response.fromStream(response);

      return HttpHelper.handleResponse<T, R>(
          httpResponse, objectFromJson, errorFromJson);
    } catch (e) {
      return GeneralResponse(
        success: false,
        data: null,
        error: HttpError(
          code: 1337,
          message: 'Something Went Wrong. Please Contact your Provider.',
          localError: '$e',
        ),
      );
    }
  }

  Future<GeneralResponse<T, R>> put(
    String path,
    Map<String, String> requestBody,
      List<http.MultipartFile> files,{
    bool isAuthRequired = true,
  }) async {
    String url = baseUrl + path;
    Uri uri = Uri.parse(url);
    try {
      var request = http.MultipartRequest('POST', uri)
        ..fields.addAll(requestBody)
        ..files.addAll(files)
        ..headers.addAll(HttpHelper.getHeader(isAuthRequired));
      var response = await request.send();

      http.Response httpResponse = await http.Response.fromStream(response);

      return HttpHelper.handleResponse<T, R>(
          httpResponse, objectFromJson, errorFromJson);
    } catch (e) {
      return GeneralResponse(
        success: false,
        data: null,
        error: HttpError(
          code: 1337,
          message: 'Something Went Wrong. Please Contact your Provider.',
          localError: '$e',
        ),
      );
    }
  }

  Future<GeneralResponse<T, R>> delete(
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

      return HttpHelper.handleResponse<T, R>(
          response, objectFromJson, errorFromJson);
    } catch (e) {
      return GeneralResponse(
        success: false,
        data: null,
        error: HttpError(
          code: 1337,
          message: 'Something Went Wrong. Please Contact your Provider.',
          localError: '$e',
        ),
      );
    }
  }
}
