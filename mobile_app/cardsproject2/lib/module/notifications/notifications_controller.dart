import 'package:get/get.dart';
import '../../service/http_client/model/general_response.dart';
import '../../service/http_client/model/pageination_response.dart';
import 'model/notification.dart';
import 'notifications_repository.dart';

class NotificationsController extends GetxController {
  //Declarations
  final RxList<Notification> _notifications = <Notification>[].obs;
  final RxInt _numberOfUnreadNotifications = 0.obs;

  //Getters
  List<Notification> get notifications => _notifications.toList();
  int get numberOfUnreadNotifications => _numberOfUnreadNotifications.value;

  //Logic
  @override
  onInit() {
    getNotifications();
    super.onInit();
  }

  getNotifications() async {
    _notifications.clear();
    GeneralResponse<PaginationResponse<Notification>, dynamic> response =
        await NotificationsRepository().getNotificationApi(page: 1);
    if (response.success) {
      _notifications.addAll(response.data?.data ?? []);
      _numberOfUnreadNotifications.value = notifications
          .where((notification) => !(notification.isRead ?? false))
          .length;
    } else {
      _notifications.clear();
    }
  }
}
