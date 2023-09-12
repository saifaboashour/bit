import '../../../service/http_client/api_routes.dart';
import '../../../service/http_client/http_client.dart';
import '../../../service/http_client/model/general_response.dart';
import 'model/login_response.dart';
import 'model/login_error.dart';

class LoginRepository {
  final HttpClient<LoginResponse, LoginError> _httpClient =
      HttpClient<LoginResponse, LoginError>(
          (json) => LoginResponse.fromJson(json),
          (json) => LoginError.fromJson(json));

  Future<GeneralResponse<LoginResponse, LoginError>> loginApi(
      Map<String, String> body) async {
    String path = ApiRoutes.loginUrl;
    final response = await _httpClient.post(path, body, isAuthRequired: false);
    return response;
  }
}
