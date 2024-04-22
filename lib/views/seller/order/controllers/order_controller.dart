import 'package:dukaan/preferences/preferences.dart';
import 'package:dukaan/services/api/api_constants.dart';
import 'package:dukaan/services/api/base_client.dart';
import 'package:dukaan/views/seller/order/models/orders.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  RxInt selectedIndex = 0.obs;
  RxBool isLoading = true.obs;
  RxBool isServerError = false.obs;
  RxString status = "In-Progress".obs;

  Orders? orders;

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }

  Future<void> getOrders() async {
    await BaseClient.safeApiCall(
      ApiConstants.GET_ORDERS,
      RequestType.get,
      headers: await BaseClient.generateHeadersWithToken(
          token: Preferences().getToken()),
      queryParameters: {"status": status.value},
      onSuccess: (response) {
        addProductCategory(response.data);
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

  addProductCategory(response) {
    orders = Orders.fromJson(response);
    isServerError.value = false;
    isLoading.value = false;
  }
}
