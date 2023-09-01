import 'dart:convert';
import 'dart:developer';

import 'package:cardsproject2/service/http_client/model/general_response.dart';
import 'package:cardsproject2/service/http_client/model/http_error.dart';
import 'package:http/http.dart' as http;

class HttpHelper {
  static Map<String, String> getHeader(bool isAuthRequired) {
    Map<String, String> header = {};
    String? token = '';
    header['Content-Type'] = 'application/json';
    if (isAuthRequired) {
      header['Authorization'] = token;
    } else {
      header['No-Auth'] = 'True';
      header['Access-Control-Allow-Orign'] = '*';
    }
    return header;
  }

  static Future<GeneralResponse<J>> handleResponse<J>(http.Response response,
      J Function(Map<String, dynamic>)? objectFromJsonAsParamerter) async {
    GeneralResponse<J>? responseFromJsonGeneric(String response) {
      try {
        dynamic json = jsonDecode(response);
        return GeneralResponse.fromJson(json, objectFromJsonAsParamerter);
      } catch (e) {
        log('Exception: $e');
        return null;
      }
    }

    GeneralResponse<J>? responseBody = responseFromJsonGeneric(response.body);
    if (responseBody != null) {
      return responseBody;
    } else {
      return GeneralResponse(
        success: false,
        data: null,
        error: HttpError(
          code: response.statusCode,
          message: 'Something Went Wrong',
          details: response.body,
        ),
      );
    }
  }
}
