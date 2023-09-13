import 'package:cardsproject2/module/authentication/one_time_password/model/otp_error.dart';

import '../../../service/http_client/api_routes.dart';
import '../../../service/http_client/http_client.dart';
import '../../../service/http_client/model/general_response.dart';
import 'model/otp_reponse.dart';

class OneTimePasswordRepository {
  final HttpClient<OtpResponse, OtpError> _httpClient =
      HttpClient<OtpResponse, OtpError>(
          (json) => OtpResponse.fromJson(json), null);

  Future<GeneralResponse<OtpResponse, OtpError>> verifyOtpApi(
      Map<String, String> requestBody) async {
    String path = ApiRoutes.oneTimePasswordUrl;
    final response = await _httpClient.post(
      path,
      requestBody,
      isAuthRequired: false,
    );
    return response;
  }
}
