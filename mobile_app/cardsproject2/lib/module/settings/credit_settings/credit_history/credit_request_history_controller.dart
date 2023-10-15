import 'package:get/get.dart';

import '../../../../service/http_client/model/general_response.dart';
import 'credit_request_history_repository.dart';
import 'model/credit_transaction.dart';

class CreditRequestHistoryController extends GetxController {
  //Declarations
  final RxList<CreditTransaction> _creditTransactions = <CreditTransaction>[].obs;

  //Getters
  List<CreditTransaction> get creditTransactions => _creditTransactions.toList();

  //Logic
  @override
  onInit() {
    getTransactionHistoryData();
    super.onInit();
  }

  getTransactionHistoryData() async {
    GeneralResponse<CreditTransaction, dynamic> response =
    await CreditRequestHistoryRepository().getCreditHistoryApi();
    if (response.success) {
      _creditTransactions.addAll(response.listData ?? []);
    }
  }
}