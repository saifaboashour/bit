import 'package:cardsproject2/module/authentication/model/user.dart';

import '../../service/http_client/api_routes.dart';
import '../../service/http_client/http_client.dart';
import '../../service/http_client/model/general_response.dart';
import 'model/countries_response.dart';

class AuthenticationRepository {
  final HttpClient<CountryResponse, dynamic> _httpCountriesClient =
      HttpClient<CountryResponse, dynamic>(
          (json) => CountryResponse.fromJson(json), null);

  final HttpClient<User, dynamic> _httpUserClient =
      HttpClient<User, dynamic>((json) => User.fromJson(json), null);

  Future<GeneralResponse<CountryResponse, dynamic>> getCountriesApi() async {
    String path = ApiRoutes.countriesUrl;
    final response = await _httpCountriesClient.get(path,
        isAuthRequired: false, isList: true);
    return response;
  }

  Future<GeneralResponse<User, dynamic>> getUserApi() async {
    String path = ApiRoutes.userProfile;
    final response = await _httpUserClient.get(path, isAuthRequired: true);
    return response;
  }
}
