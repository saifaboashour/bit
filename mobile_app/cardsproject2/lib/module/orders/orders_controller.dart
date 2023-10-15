import 'package:cardsproject2/module/orders/model/order.dart';
import 'package:cardsproject2/module/orders/orders_repository.dart';
import 'package:get/get.dart';

import '../../service/http_client/model/general_response.dart';
import '../../service/http_client/model/pageination_response.dart';

class OrdersController extends GetxController {
  //Declarations
  final RxList<Order> _orders = <Order>[].obs;

  //Getters
  List<Order> get orders => _orders.toList();

  //Logic
  @override
  onInit() {
    getOrders();
    super.onInit();
  }

  getOrders() async {
    _orders.clear();
    GeneralResponse<PaginationResponse<Order>, dynamic> response =
    await OrdersRepository().getOrdersApi(page: 1);
    if (response.success) {
      _orders.addAll(response.data?.data ?? []);
    } else {
      _orders.clear();
    }
  }
}
