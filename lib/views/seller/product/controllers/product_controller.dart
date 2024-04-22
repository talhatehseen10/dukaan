import 'package:dukaan/preferences/preferences.dart';
import 'package:dukaan/services/api/api_constants.dart';
import 'package:dukaan/services/api/base_client.dart';
import 'package:dukaan/views/seller/product/models/product/product_by_category.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  RxInt selectedIndex = 0.obs;
  RxBool isLoading = true.obs;
  RxBool isServerError = false.obs;

  ProductByCategory? productByCategory;

  @override
  void onInit() {
    getProductByCategory();
    super.onInit();
  }

  Future<void> getProductByCategory() async {
    await BaseClient.safeApiCall(
      "${ApiConstants.GET_PRODUCT_BY_CATEGORY}${Preferences().getCatId()}",
      RequestType.get,
      headers: await BaseClient.generateHeadersWithToken(
          token: Preferences().getToken()),
      queryParameters: {"sort_by": "id"},
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
    productByCategory = ProductByCategory.fromJson(response);
    isServerError.value = false;
    isLoading.value = false;
  }
}
