import 'package:dukaan/preferences/preferences.dart';
import 'package:dukaan/services/api/api_constants.dart';
import 'package:dukaan/services/api/base_client.dart';
import 'package:dukaan/views/vendor/home/models/dashboard.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool isBottomContainerVisible = false.obs;
  RxBool isLoading = true.obs;
  RxBool isServerError = false.obs;
  Dashboard? dashboard;

  @override
  void onInit() {
    getMetrics();
    super.onInit();
  }

  Future<void> getMetrics() async {
    await BaseClient.safeApiCall(
      ApiConstants.GET_DASHBOARD_METRICS,
      RequestType.get,
      headers: await BaseClient.generateHeadersWithToken(
          token: Preferences().getToken()),
      onSuccess: (response) {
        addMetrics(response.data);
      },
      onLoading: () {
        isLoading.value = true;
      },
      onError: (e) {
        isServerError.value = true;
        isLoading.value = false;
      },
    );
  }

  addMetrics(response) {
    dashboard = Dashboard.fromJson(response);
    isServerError.value = false;
    isLoading.value = false;
  }
}
