import 'dart:convert';
import 'dart:developer';

import 'package:cardsproject2/service/http_client/model/general_response.dart';
import 'package:cardsproject2/service/http_client/model/http_error.dart';
import 'package:http/http.dart' as http;

class HttpHelper {
  static Map<String, String> getHeader(bool isAuthRequired) {
    Map<String, String> header = {};
    String? token = '';
    header['Accept'] = 'application/json';
    header['accept-language'] = 'en';
    if (isAuthRequired) {
      header['Authorization'] = token;
    } else {
      header['No-Auth'] = 'True';
      header['Access-Control-Allow-Orign'] = '*';
    }
    return header;
  }

  static Future<GeneralResponse<J, R>> handleResponse<J, R>(
    http.Response response,
    J Function(Map<String, dynamic>)? objectFromJsonAsParamerter,
    R Function(Map<String, dynamic>)? errorParser, {
    bool isList = false,
  }) async {
    GeneralResponse<J, R>? responseFromJsonGeneric(String response) {
      try {
        dynamic json = jsonDecode(response);
        return GeneralResponse.fromJson(
            json, objectFromJsonAsParamerter, errorParser,isList: isList,);
      } catch (e) {
        log('Exception: $e');
        return null;
      }
    }

    if (response.statusCode == 200) {
      GeneralResponse<J, R>? responseBody =
          responseFromJsonGeneric(response.body);
      if (responseBody != null) {
        return responseBody;
      } else {
        return GeneralResponse(
          success: false,
          data: null,
          error: HttpError<R>(
            code: response.statusCode,
            message:
                jsonDecode(response.body)['message'] ?? 'Something Went Wrong',
            details: errorParser != null
                ? errorParser(jsonDecode(response.body)['errors'])
                : null,
          ),
        );
      }
    } else {
      return GeneralResponse(
        success: false,
        data: null,
        error: HttpError(
          code: response.statusCode,
          message:
              jsonDecode(response.body)['message'] ?? 'Something Went Wrong',
          details: errorParser != null
              ? errorParser(jsonDecode(response.body)['errors'])
              : null,
        ),
      );
    }
  }
}
