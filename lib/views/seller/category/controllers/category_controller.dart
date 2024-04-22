import 'package:dukaan/preferences/preferences.dart';
import 'package:dukaan/services/api/api_constants.dart';
import 'package:dukaan/services/api/base_client.dart';
import 'package:dukaan/views/seller/category/models/category.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  RxBool isLoading = true.obs;
  RxBool isServerError = false.obs;
  Category? category;

  @override
  void onInit() {
    getCategories();
    super.onInit();
  }

  Future<void> getCategories() async {
    await BaseClient.safeApiCall(
      ApiConstants.GET_CATEGORIES,
      RequestType.get,
      headers: await BaseClient.generateHeadersWithToken(
          token: Preferences().getToken()),
      onSuccess: (response) {
        addCategoriesDetail(response.data);
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

  addCategoriesDetail(response) {
    category = Category.fromJson(response);
    isServerError.value = false;
    isLoading.value = false;
  }
}
