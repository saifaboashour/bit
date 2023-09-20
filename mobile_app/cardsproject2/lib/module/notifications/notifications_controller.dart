import 'dart:developer';

import 'package:get/get.dart';

import '../../service/http_client/model/general_response.dart';
import '../../service/http_client/model/pageination_response.dart';
import 'model/notification.dart';
import 'notifications_repository.dart';

class NotificationsController extends GetxController {
  //Declerations

  //Getters

  //Logic
  @override
  onInit() {
    getNotifications();
    super.onInit();
  }

  getNotifications() async {
    GeneralResponse<PaginationResponse<Notification>, dynamic> response =
        await NotificationsRepository().getNotificationApi(page: 1);
    log('$response');
  }
}
