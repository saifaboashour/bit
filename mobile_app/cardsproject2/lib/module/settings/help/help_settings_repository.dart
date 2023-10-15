import '../../../service/http_client/api_routes.dart';
import '../../../service/http_client/http_client.dart';
import '../../../service/http_client/model/general_response.dart';
import 'model/issue_type.dart';
import 'model/terms.dart';
import 'package:http/http.dart' as http;

class HelpSettingsRepository {
  final HttpClient<Terms, dynamic> _termsAndPrivacyHttpClient =
  HttpClient<Terms, dynamic>((json) => Terms.fromJson(json), null);

  Future<GeneralResponse<Terms, dynamic>> getPrivacyPolicyApi() async {
    String path = ApiRoutes.privacyPolicyUrl;
    final response = await _termsAndPrivacyHttpClient.get(path, isAuthRequired: true);
    return response;
  }

  Future<GeneralResponse<Terms, dynamic>> getTermsAndConditionsApi() async {
    String path = ApiRoutes.termsAndConditionsUrl;
    final response = await _termsAndPrivacyHttpClient.get(path, isAuthRequired: true);
    return response;
  }

  final HttpClient<IssueType, dynamic> _issueTypesHttpClient =
  HttpClient<IssueType, dynamic>(
          (json) => IssueType.fromJson(json),null);

  Future<GeneralResponse<IssueType, dynamic>>
  getIssueTypesApi() async {
    String path = ApiRoutes.issueTypesUrl;
    final response = await _issueTypesHttpClient.get(path, isList: true);
    return response;
  }

  final HttpClient<dynamic, dynamic> _reportIssueHttpClient =
  HttpClient<dynamic, dynamic>(
          null,null);

  Future<GeneralResponse<dynamic, dynamic>>
  reportIssueApi( Map<String, String> body, List<http.MultipartFile> files) async {
    String path = ApiRoutes.issuesUrl;
    final response = await _reportIssueHttpClient.post(path, body,files);
    return response;
  }
}
