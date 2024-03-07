import 'package:dukaan/preferences/preferences.dart';
import 'package:dukaan/services/api/api_constants.dart';
import 'package:dukaan/services/api/base_client.dart';
import 'package:dukaan/views/custom_navigation_bar/controllers/custom_navigation_controller.dart';
import 'package:dukaan/views/home/models/products.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool isLoading = true.obs;
  late CustomNavigationController customNavigationController;
  Products? products;

  @override
  void onInit() {
    customNavigationController = Get.find<CustomNavigationController>();
    getProducts();
    super.onInit();
  }

  Future<void> getProducts() async {
    await BaseClient.safeApiCall(
      ApiConstants.PRODUCTS,
      RequestType.get,
      headers: await BaseClient.generateHeadersWithToken(
          token: Preferences().getToken()),
      queryParameters: {
        "summary": true,
      },
      onSuccess: (response) {
        addProducts(response.data);
      },
      onLoading: () {
        isLoading.value = true;
      },
      onError: (e) {
        isLoading.value = false;
      },
    );
  }

  void addProducts(Map<String, dynamic> data) {
    products = Products.fromJson(data);
    isLoading.value = false;
  }
}
