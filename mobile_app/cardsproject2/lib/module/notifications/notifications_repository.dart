import 'package:cardsproject2/module/notifications/model/notification.dart';
import 'package:cardsproject2/service/http_client/model/general_response.dart';

import '../../service/http_client/api_routes.dart';
import '../../service/http_client/http_client.dart';
import '../../service/http_client/model/pageination_response.dart';

class NotificationsRepository {
  final HttpClient<PaginationResponse<Notification>, dynamic>
      _httpCountriesClient =
      HttpClient<PaginationResponse<Notification>, dynamic>(
          (json) => PaginationResponse<Notification>.fromJson(
              json, Notification.fromJson),
          null);

  Future<GeneralResponse<PaginationResponse<Notification>, dynamic>>
      getNotificationApi({required int page}) async {
    String path = '${ApiRoutes.notifications}$page';
    final response = await _httpCountriesClient.get(path);
    return response;
  }
}
