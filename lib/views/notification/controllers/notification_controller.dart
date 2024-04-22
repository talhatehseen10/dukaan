import 'package:dukaan/preferences/preferences.dart';
import 'package:dukaan/services/api/api_constants.dart';
import 'package:dukaan/services/api/base_client.dart';
import 'package:dukaan/views/notification/models/notification.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  RxBool isLoading = false.obs;
  Notification? notification;

  @override
  void onInit() {
    getNotifications();
    super.onInit();
  }

  Future<void> getNotifications() async {
    await BaseClient.safeApiCall(
      ApiConstants.GET_NOTIFICATIONS,
      RequestType.get,
      headers: await BaseClient.generateHeadersWithToken(
          token: Preferences().getToken()),
      onSuccess: (response) {
        addNotification(response.data);
      },
      onLoading: () {
        isLoading.value = true;
      },
      onError: (e) {
        isLoading.value = false;
      },
    );
  }

  void addNotification(response) {
    isLoading.value = true;
    notification = Notification.fromJson(response);
    isLoading.value = false;
  }
}
