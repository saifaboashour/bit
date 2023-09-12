import 'package:cardsproject2/module/authentication/register/model/register_error.dart';

import '../../../service/http_client/api_routes.dart';
import '../../../service/http_client/http_client.dart';
import '../../../service/http_client/model/general_response.dart';
import 'model/register_response.dart';

class RegisterRepository {
  final HttpClient<RegisterResponse, RegisterError> _httpClient =
      HttpClient<RegisterResponse, RegisterError>(
          (json) => RegisterResponse.fromJson(json),
          (json) => RegisterError.fromJson(json));

  Future<GeneralResponse<RegisterResponse, RegisterError>> registerApi(
      Map<String, String> body) async {
    String path = ApiRoutes.registerUrl;
    final response = await _httpClient.post(path, body, isAuthRequired: false);
    return response;
  }
}
