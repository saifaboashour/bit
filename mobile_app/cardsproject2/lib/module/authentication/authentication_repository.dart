import '../../service/http_client/api_routes.dart';
import '../../service/http_client/http_client.dart';
import '../../service/http_client/model/general_response.dart';
import 'model/countries_response.dart';

class AuthenticationRepository {
  final HttpClient<CountryResponse, dynamic> _httpClient =
      HttpClient<CountryResponse, dynamic>(
          (json) => CountryResponse.fromJson(json), null);

  Future<GeneralResponse<CountryResponse, dynamic>> getCountriesApi() async {
    String path = ApiRoutes.countriesUrl;
    final response =
        await _httpClient.get(path, isAuthRequired: false, isList: true);
    return response;
  }
}
