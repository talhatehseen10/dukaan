import 'package:dukaan/preferences/preferences.dart';
import 'package:dukaan/services/api/api_constants.dart';
import 'package:dukaan/services/api/base_client.dart';
import 'package:dukaan/views/seller/product/models/product_details.dart';
import 'package:dukaan/views/seller/product/models/product_variant.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  RxBool isLoading = true.obs;
  ProductDetails? productDetails;
  ProductVariant? productVariant;

  @override
  void onInit() {
    getProductDetail();
    super.onInit();
  }

  Future<void> getProductDetail() async {
    await BaseClient.safeApiCall(
      ApiConstants.PRODUCT_DETAIL,
      RequestType.get,
      headers: await BaseClient.generateHeadersWithToken(
          token: Preferences().getToken()),
      queryParameters: {
        "product_id": Get.arguments[0],
      },
      onSuccess: (response) {
        addProductDetail(response.data);
      },
      onLoading: () {
        isLoading.value = true;
      },
      onError: (e) {
        isLoading.value = false;
      },
    );
  }

  addProductDetail(response) {
    productDetails = ProductDetails.fromJson(response);
    productVariant = productDetails!.data!.productVariant![0];
    isLoading.value = false;
  }

  addProductVariant(ProductVariant productVariant) {
    isLoading.value = true;
    this.productVariant = productVariant;
    isLoading.value = false;
  }
}
