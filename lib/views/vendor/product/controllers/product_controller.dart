import 'package:dukaan/preferences/preferences.dart';
import 'package:dukaan/services/api/api_constants.dart';
import 'package:dukaan/services/api/base_client.dart';
import 'package:dukaan/views/vendor/product/models/products.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  RxBool isBottomContainerVisible = false.obs;
  RxBool isLoading = true.obs;
  RxBool isServerError = false.obs;
  Products? products;

  @override
  void onInit() {
    getProduct();
    super.onInit();
  }

  Future<void> getProduct() async {
    await BaseClient.safeApiCall(
      ApiConstants.PRODUCTS,
      RequestType.get,
      headers: await BaseClient.generateHeadersWithToken(
          token: Preferences().getToken()),
      onSuccess: (response) {
        addProducts(response.data);
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

  addProducts(response) {
    products = Products.fromJson(response);
    isServerError.value = false;
    isLoading.value = false;
  }
}
