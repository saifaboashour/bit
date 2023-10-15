import 'package:cardsproject2/module/authentication/model/user.dart';
import 'package:http/http.dart' as http;
import '../../../service/http_client/api_routes.dart';
import '../../../service/http_client/http_client.dart';
import '../../../service/http_client/model/general_response.dart';

class AccountSettingsRepository {
  final HttpClient<dynamic, dynamic> _accountSettingsHttpClient =
  HttpClient<dynamic, dynamic>(
          null, null);

  Future<GeneralResponse<dynamic, dynamic>> updateProfileApi(
      Map<String, String> body, List<http.MultipartFile> files) async {
    String path = ApiRoutes.profileUrl;
    final response =
    await _accountSettingsHttpClient.put(path, body, files);
    return response;
  }

  Future<GeneralResponse<dynamic, dynamic>> updatePasswordApi(
      Map<String, String> body) async {
    String path = ApiRoutes.changePasswordUrl;
    final response =
    await _accountSettingsHttpClient.put(path, body, []);
    return response;
  }
}