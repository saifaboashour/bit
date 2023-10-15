import 'dart:convert';
import 'dart:developer';

import 'package:cardsproject2/service/http_client/model/general_response.dart';
import 'package:cardsproject2/service/http_client/model/http_error.dart';
import 'package:cardsproject2/service/local_storage_manager/local_storage_manager_app.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../local_storage_manager/user_service.dart';
import '../navigation/routes.dart';

class HttpHelper {
  static Map<String, String> getHeader(bool isAuthRequired) {
    Map<String, String> header = {};

    header['Accept'] = 'application/json';
    header['accept-language'] = 'en';
    if (isAuthRequired) {
      final LocalStorageManagerApp localStorageManagerApp =
          LocalStorageManagerApp();
      String? token = (localStorageManagerApp.getUserTokens())?.accesstoken;
      if (token != null) {
        header['Authorization'] = 'Bearer $token';
      }
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
    bool isPageination = false,
  }) async {
    GeneralResponse<J, R>? responseFromJsonGeneric(String response) {
      try {
        dynamic json = jsonDecode(response);
        return GeneralResponse.fromJson(
          json,
          objectFromJsonAsParamerter,
          errorParser,
          isList: isList,
          isPageination: isPageination,
        );
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
    } else if (response.statusCode == 401) {
      final LocalStorageManagerApp localStorageManagerApp =
          LocalStorageManagerApp();
      await localStorageManagerApp.removeUserTokens();
      await localStorageManagerApp.removeUser();
      return GeneralResponse(
        success: false,
        data: null,
        error: HttpError(
          code: response.statusCode,
          message: 'Unauthorized',
          details: null,
        ),
      );
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
