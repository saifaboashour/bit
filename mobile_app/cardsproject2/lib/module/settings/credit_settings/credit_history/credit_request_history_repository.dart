import '../../../../service/http_client/api_routes.dart';
import '../../../../service/http_client/http_client.dart';
import '../../../../service/http_client/model/general_response.dart';
import 'model/credit_transaction.dart';

class CreditRequestHistoryRepository{
  final HttpClient<CreditTransaction, dynamic> _creditRequestHistoryHttpClient =
  HttpClient<CreditTransaction, dynamic>(
          (json) => CreditTransaction.fromJson(json),null);

  Future<GeneralResponse<CreditTransaction, dynamic>>
  getCreditHistoryApi() async {
    String path = ApiRoutes.creditRequestHistoryUrl;
    final response = await _creditRequestHistoryHttpClient.get(path, isList: true);
    return response;
  }
}