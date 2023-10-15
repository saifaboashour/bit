import '../../service/http_client/api_routes.dart';
import '../../service/http_client/http_client.dart';
import '../../service/http_client/model/general_response.dart';
import '../../service/http_client/model/pageination_response.dart';
import 'model/order.dart';

class OrdersRepository{
  final HttpClient<PaginationResponse<Order>, dynamic>
  _httpOrdersClient =
  HttpClient<PaginationResponse<Order>, dynamic>(
          (json) => PaginationResponse<Order>.fromJson(
          json, Order.fromJson),
      null);

  Future<GeneralResponse<PaginationResponse<Order>, dynamic>>
  getOrdersApi({required int page}) async {
    String path = '${ApiRoutes.orders}$page';
    final response = await _httpOrdersClient.get(path, isPageination: true);
    return response;
  }
}